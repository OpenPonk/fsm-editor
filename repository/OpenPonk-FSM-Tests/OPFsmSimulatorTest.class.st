"
Verifies the headless finite-state machine simulator presenter, terminal panel widgets, command activation and execution, preconditions, stepping controls, and hidden element handling.
"
Class {
	#name : 'OPFsmSimulatorTest',
	#superclass : 'OPAbstractUITest',
	#instVars : [
		'project',
		'projectController',
		'diagramController',
		'model',
		'simulator',
		'existingWindows'
	],
	#category : 'OpenPonk-FSM-Tests-Simulations',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Simulations'
}

{ #category : 'running' }
OPFsmSimulatorTest >> setUp [

	super setUp.
	existingWindows := (self currentWorld submorphs select: [ :eachMorph | eachMorph isSystemWindow ]) asIdentitySet.
	model := OPFsmExamples exampleDivisibility.
	project := OPProject named: 'FSM Simulator Test'.
	project addModel: model.
	projectController := OPProjectController forProject: project.
	diagramController := OPFsmController new.
	projectController addDiagramController: diagramController.
	diagramController canvasPresenter: OPHeadlessCanvasPresenter new.
	diagramController diagramElement: (OPOpenPonkDiagram forModelElement: model).
	diagramController model: model.
	diagramController showAllElements.
	simulator := OPFsmSimulator newApplication: SpApplication defaultApplication.
	simulator instVarNamed: #diagramController put: diagramController.
	simulator build
]

{ #category : 'running' }
OPFsmSimulatorTest >> tearDown [

	| currentWindows |
	simulator := nil.
	diagramController := nil.
	projectController := nil.
	project := nil.
	model := nil.
	existingWindows ifNotNil: [
			currentWindows := (self currentWorld submorphs select: [ :eachMorph | eachMorph isSystemWindow ]) asIdentitySet.
			(currentWindows difference: existingWindows) do: #delete.
			existingWindows := nil ].
	super tearDown
]

{ #category : 'tests' }
OPFsmSimulatorTest >> testBackAfterSingleSymbolFailureRestoresButtonsAndTerminalBox [

	| zeroState zeroShape firstBox |
	zeroState := model states detect: [ :eachState | eachState name = '%3=0' ].
	zeroShape := diagramController roassalShapeForModel: zeroState.

	simulator input text: '9'.
	simulator startButton click.
	simulator nextButton click.
	self deny: simulator nextButton isEnabled description: 'Next button must be disabled after failure on single symbol'.
	self assert: simulator backButton isEnabled description: 'Back button must be enabled after failure on single symbol'.
	self assert: zeroShape borderColor equals: Color red.

	simulator backButton click.
	self assert: simulator nextButton isEnabled description: 'Next button must be re-enabled after stepping back from failure'.
	self assert: simulator runButton isEnabled description: 'Run button must be re-enabled after stepping back from failure'.
	self deny: simulator backButton isEnabled description: 'Back button must be disabled after returning to starting state'.
	self assert: zeroShape borderColor equals: Color orange.
	firstBox := simulator letterPanel adapter widget submorphs first.
	self assert: firstBox borderColor equals: Color black
]

{ #category : 'tests' }
OPFsmSimulatorTest >> testFailureMidInputDisablesNextAndRunButtons [

	| zeroState zeroShape |
	zeroState := model states detect: [ :eachState | eachState name = '%3=0' ].
	zeroShape := diagramController roassalShapeForModel: zeroState.

	simulator input text: '9, 0'.
	simulator startAction.
	self assert: simulator nextButton isEnabled description: 'Next button must be enabled after starting simulation'.
	self assert: simulator runButton isEnabled description: 'Run button must be enabled after starting simulation'.
	self deny: simulator backButton isEnabled description: 'Back button must be disabled at initial step'.

	simulator nextAction.
	self deny: simulator nextButton isEnabled description: 'Next button must remain disabled after mid-input failure'.
	self deny: simulator runButton isEnabled description: 'Run button must remain disabled after mid-input failure'.
	self assert: simulator backButton isEnabled description: 'Back button must be enabled after mid-input failure'.
	self assert: zeroShape borderColor equals: Color red.
	self assert: simulator letterPanel adapter widget submorphs first borderColor equals: Color red
]

{ #category : 'tests' }
OPFsmSimulatorTest >> testInitialStateAndInputReactivity [

	self assert: simulator inputLabel label equals: 'Input:'.
	self assert: simulator separatorLabel label equals: 'Separated by:'.
	self assert: simulator separatorInput text equals: ','.
	self assert: simulator input text equals: ''.
	self assert: simulator letterPanel data equals: ''.
	self assert: simulator resetButton isEnabled description: 'Reset button must be enabled initially'.
	self deny: simulator startButton isEnabled description: 'Start button must be disabled while input is empty'.
	self deny: simulator stopButton isEnabled description: 'Stop button must be disabled initially'.
	self deny: simulator backButton isEnabled description: 'Back button must be disabled initially'.
	self deny: simulator nextButton isEnabled description: 'Next button must be disabled initially'.
	self deny: simulator runButton isEnabled description: 'Run button must be disabled initially'.

	simulator input text: '1, 0'.
	self assert: simulator startButton isEnabled description: 'Start button must become enabled when input is non-empty'.
	simulator input text: ''.
	self deny: simulator startButton isEnabled description: 'Start button must become disabled when input is cleared'
]

{ #category : 'tests' }
OPFsmSimulatorTest >> testInputDataParsingWithAndWithoutSeparator [

	simulator input text: ' 1 , , 0 , 1 '.
	simulator separatorInput text: ','.
	self assert: simulator inputData asArray equals: #( '1' '0' '1' ).

	simulator input text: 'a; b ; ;c'.
	simulator separatorInput text: ';'.
	self assert: simulator inputData asArray equals: #( 'a' 'b' 'c' ).

	simulator input text: ' 101 '.
	simulator separatorInput text: ''.
	self assert: simulator inputData asArray equals: #( '1' '0' '1' )
]

{ #category : 'tests' }
OPFsmSimulatorTest >> testOpenSimulatorCommandActivationAndExecution [

	| activation mockWorkbench editor command openedWindows simulatorWindow |
	activation := OPFsmOpenSimulatorCommand modelMenuActivation.
	self assert: activation menuGroup identicalTo: OPModelBasicMenuGroup.
	self assert: activation menuItemOrder equals: 10.

	mockWorkbench := Mock new.
	mockWorkbench stub projectController willReturn: projectController.
	editor := (OPEditor on: OPFsmPlugin new)
		          workbench: mockWorkbench;
		          yourself.
	editor instVarNamed: #diagramController put: diagramController.
	diagramController editor: editor.

	command := OPFsmOpenSimulatorCommand new.
	command prepareFullExecutionInContext: editor.
	command execute.

	openedWindows := (self currentWorld submorphs select: [ :eachMorph | eachMorph isSystemWindow ]) asIdentitySet difference:
		                 existingWindows.
	self assert: openedWindows size equals: 1.
	simulatorWindow := openedWindows anyOne.
	self assert: simulatorWindow label equals: 'Finite State Machine Simulator'
]

{ #category : 'tests' }
OPFsmSimulatorTest >> testPreconditionsNonInteractive [

	| abortedMessages emptyProject emptyProjectController emptyModel emptyDiagramController noTransitionProject noTransitionProjectController noTransitionModel noTransitionDiagramController isolatedInitialState |
	self assert: simulator preconditions description: 'Valid divisibility model must satisfy simulator preconditions'.

	abortedMessages := OrderedCollection new.
	(UIManager default stub abort: Any) will: [ :message | abortedMessages add: message ].
	[
		emptyModel := OPFsm named: 'Empty'.
		emptyProject := OPProject named: 'Empty Project'.
		emptyProject addModel: emptyModel.
		emptyProjectController := OPProjectController forProject: emptyProject.
		emptyDiagramController := OPFsmController new.
		emptyProjectController addDiagramController: emptyDiagramController.
		emptyDiagramController model: emptyModel.
		simulator instVarNamed: #diagramController put: emptyDiagramController.
		self deny: simulator preconditions description: 'Model without initial state must fail preconditions'.
		simulator startAction.
		self deny: simulator stopButton isEnabled description: 'Failed preconditions must not start simulation'.

		noTransitionModel := OPFsm named: 'NoOutgoing'.
		isolatedInitialState := OPFsmInitialState named: 'init'.
		noTransitionModel add: isolatedInitialState.
		noTransitionProject := OPProject named: 'NoOutgoing Project'.
		noTransitionProject addModel: noTransitionModel.
		noTransitionProjectController := OPProjectController forProject: noTransitionProject.
		noTransitionDiagramController := OPFsmController new.
		noTransitionProjectController addDiagramController: noTransitionDiagramController.
		noTransitionDiagramController model: noTransitionModel.
		simulator instVarNamed: #diagramController put: noTransitionDiagramController.
		self deny: simulator preconditions description: 'Initial state without outgoing transitions must fail preconditions' ] ensure: [
		UIManager default recoverFromGHMutation ].

	self
		assert: abortedMessages asArray
		equals:
		#( 'No initial state has been defined.' 'No initial state has been defined.' 'No outgoing transitions from initial state.' )
]

{ #category : 'tests' }
OPFsmSimulatorTest >> testSimulationIgnoresHiddenDiagramElements [

	| hiddenState zeroState zeroShape |
	hiddenState := model states detect: [ :eachState | eachState name = '%3=1' ].
	zeroState := model states detect: [ :eachState | eachState name = '%3=0' ].
	zeroShape := diagramController roassalShapeForModel: zeroState.
	diagramController hideModelFromDiagram: hiddenState.

	simulator input text: '1, 1'.
	simulator startAction.
	self assert: zeroShape borderColor equals: Color orange.
	5 timesRepeat: [ simulator nextAction ].
	self assert: zeroShape borderColor equals: Color green.

	simulator resetAction.
	self assert: zeroShape borderColor equals: Color black
]

{ #category : 'tests' }
OPFsmSimulatorTest >> testSuccessfulStepByStepSimulationResetStopAndCompletedRunAction [

	| zeroState zeroShape boxes |
	zeroState := model states detect: [ :eachState | eachState name = '%3=0' ].
	zeroShape := diagramController roassalShapeForModel: zeroState.

	simulator input text: '1, 1'.
	simulator startButton click.
	self deny: simulator input isEnabled description: 'Input field must be disabled during simulation'.
	self deny: simulator separatorInput isEnabled description: 'Separator field must be disabled during simulation'.
	self deny: simulator startButton isEnabled description: 'Start button must be disabled during simulation'.
	self assert: simulator stopButton isEnabled description: 'Stop button must be enabled during simulation'.
	self assert: zeroShape borderColor equals: Color orange.

	boxes := simulator letterPanel adapter widget submorphs.
	self assert: boxes size equals: 2.

	simulator nextButton click.
	self assert: boxes first borderColor equals: Color orange.
	self assert: simulator backButton isEnabled description: 'Back button must be enabled after first step'.

	4 timesRepeat: [ simulator nextButton click ].
	self assert: zeroShape borderColor equals: Color green.
	self assert: boxes first borderColor equals: Color green muchDarker.
	self assert: boxes second borderColor equals: Color green muchDarker.
	self deny: simulator nextButton isEnabled description: 'Next button must be disabled after reaching success'.
	self deny: simulator runButton isEnabled description: 'Run button must be disabled after reaching success'.

	simulator runButton performAction.
	self deny: simulator nextButton isEnabled description: 'Run action on completed recognizer must keep next disabled'.
	self deny: simulator backButton isEnabled description: 'Run action on completed recognizer must disable back without stepping'.
	self deny: simulator runButton isEnabled description: 'Run action on completed recognizer must keep run disabled'.

	simulator resetButton click.
	self assert: zeroShape borderColor equals: Color black.

	simulator stopButton click.
	self assert: simulator input isEnabled description: 'Stop action must re-enable input field'.
	self assert: simulator separatorInput isEnabled description: 'Stop action must re-enable separator field'.
	self assert: simulator startButton isEnabled description: 'Stop action must re-enable start button'.
	self deny: simulator stopButton isEnabled description: 'Stop action must disable stop button'.
	self assertEmpty: simulator letterPanel adapter widget submorphs
]

{ #category : 'tests' }
OPFsmSimulatorTest >> testTerminalPanelPresenterMorphBoxAndAnnouncements [

	| dataEvent stateEvent boxMorph panelMorph presenter receivedDataEvents receivedStateEvents |
	dataEvent := OPFsmTerminalDataChanged data: #( 'a' 'b' ).
	self assert: dataEvent data equals: #( 'a' 'b' ).

	stateEvent := OPFsmTerminalRecognizerStateChanged at: 2 to: #processed.
	self assert: stateEvent inputPosition equals: 2.
	self assert: stateEvent inputState equals: #processed.

	boxMorph := OPFsmTerminalBoxMorph new.
	self assert: boxMorph defaultBorderWidth equals: 1.
	self assert: boxMorph defaultBounds equals: (0 @ 0 corner: 25 @ 25).
	self assert: boxMorph defaultColor equals: boxMorph theme windowColor.
	boxMorph terminal: 'x'.
	self assert: boxMorph submorphs size equals: 1.
	boxMorph processed.
	self assert: boxMorph borderColor equals: Color orange.
	boxMorph failure.
	self assert: boxMorph borderColor equals: Color red.
	boxMorph success.
	self assert: boxMorph borderColor equals: Color green muchDarker.
	boxMorph normal.
	self assert: boxMorph borderColor equals: Color black.

	panelMorph := OPFsmTerminalPanelMorph new.
	self assert: panelMorph defaultColor equals: Color transparent.
	panelMorph data: #( 'a' 'b' 'c' ).
	self assert: panelMorph submorphs size equals: 3.
	panelMorph changeBoxAt: 2 to: #processed.
	self assert: panelMorph submorphs first borderColor equals: Color green muchDarker.
	self assert: panelMorph submorphs second borderColor equals: Color orange.
	self assert: panelMorph submorphs third borderColor equals: Color black.

	presenter := OPFsmTerminalPanelPresenter newApplication: SpApplication defaultApplication.
	receivedDataEvents := OrderedCollection new.
	receivedStateEvents := OrderedCollection new.
	presenter whenDataChangedDo: [ :event | receivedDataEvents add: event ] for: self.
	presenter whenRecognizerStateChangedDo: [ :event | receivedStateEvents add: event ] for: self.
	[
		presenter data: #( '1' '0' ).
		presenter changeBoxAt: 1 to: #failure.
		self assert: presenter data equals: #( '1' '0' ).
		self assert: receivedDataEvents size equals: 1.
		self assert: receivedDataEvents first data equals: #( '1' '0' ).
		self assert: receivedStateEvents size equals: 1.
		self assert: receivedStateEvents first inputPosition equals: 1.
		self assert: receivedStateEvents first inputState equals: #failure ] ensure: [ presenter announcer unsubscribe: self ]
]
