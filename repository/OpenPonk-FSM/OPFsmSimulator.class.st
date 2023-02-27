"
I manage visualization of recognizer in DCEditor.

!! Responsibility

Observe Recognizer events and highlight/unhighlight figures through diagram controller.

!! Collaborators

DCFsmRecognizer
DCFsmController
"
Class {
	#name : #OPFsmSimulator,
	#superclass : #SpPresenter,
	#instVars : [
		'diagramController',
		'recognizer',
		'input',
		'inputLabel',
		'startButton',
		'stopButton',
		'resetButton',
		'letterPanel',
		'backButton',
		'nextButton',
		'separatorInput',
		'separatorLabel',
		'runButton'
	],
	#category : #'OpenPonk-FSM-Simulations'
}

{ #category : #'as yet unclassified' }
OPFsmSimulator class >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: #inputLabel width: 50;
				   add: #input;
				   add: #separatorLabel width: 80;
				   add: #separatorInput width: 60;
				   yourself)
		  height: 25;
		  add: (SpBoxLayout newLeftToRight
				   add: #startButton;
				   add: #stopButton;
				   add: #resetButton;
				   yourself)
		  height: self toolbarHeight;
		  add: (SpBoxLayout newLeftToRight
				   add: #letterPanel;
				   yourself)
		  height: self toolbarHeight;
		  add: (SpBoxLayout newLeftToRight
				   add: #backButton;
				   add: #nextButton;
				   add: #runButton;
				   add: SpNullPresenter new;
				   yourself)
		  height: self toolbarHeight;
		  add: SpNullPresenter new;
		  yourself
]

{ #category : #toolbar }
OPFsmSimulator class >> toolbarMenu: aBuilder [

	<opEditorToolbarMenu: #OPFsmPlugin>
	(aBuilder item: 'Open Simulator')
		icon: OPCoreIcons opFsmDiagramIcon;
		action: [ self new openOn: aBuilder model diagramController ]
]

{ #category : #actions }
OPFsmSimulator >> backAction [
	nextButton disable.
	backButton disable.
	runButton disable.
	recognizer back
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> backButton [
	^ backButton
]

{ #category : #'as yet unclassified' }
OPFsmSimulator >> connectPresenters [

	super connectPresenters.
	inputLabel label: 'Input:'.
	input whenTextChangedDo: [ :text | 
		text
			ifEmpty: [ startButton disable ]
			ifNotEmpty: [ startButton enable ] ].
	separatorLabel label: 'Separated by:'.
	separatorInput text: ','.
	startButton
		label: 'Start';
		iconName: #smallDoIt;
		action: [ self startAction ];
		disable.
	stopButton
		label: 'Stop';
		iconName: #stop;
		action: [ self stopAction ];
		disable.
	resetButton
		label: 'Reset';
		iconName: #smallUpdate;
		action: [ self resetAction ].
	letterPanel data: ''.
	backButton
		label: 'Back';
		iconName: #back;
		action: [ self backAction ];
		disable.
	nextButton
		label: 'Next';
		iconName: #forward;
		action: [ self nextAction ];
		disable.
	runButton
		label: 'Run';
		iconName: #smallDoIt;
		action: [ self runAction ];
		disable
]

{ #category : #initialization }
OPFsmSimulator >> initialize [
	recognizer := OPFsmRecognizer new.
	self watchRecognizer: recognizer.
	super initialize
]

{ #category : #'as yet unclassified' }
OPFsmSimulator >> initializePresenters [

	inputLabel := self newLabel.
	input := self newTextInput.
	separatorLabel := self newLabel.
	separatorInput := self newTextInput.
	startButton := self newButton.
	stopButton := self newButton.
	resetButton := self newButton.
	letterPanel := self instantiate: OPFsmTerminalPanelPresenter.
	backButton := self newButton.
	nextButton := self newButton.
	runButton := self newButton
]

{ #category : #'as yet unclassified' }
OPFsmSimulator >> initializeWindow: aWindow [

	aWindow initialExtent: 400 @ 300.
	aWindow title: 'Finite State Machine Simulator'
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> input [
	^ input
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> inputData [
	"^self input text"

	^ self separatorInput text
		ifEmpty: [ self input text trim asArray collect: #asString ]
		ifNotEmpty: [ :sep | ^ ((self input text splitOn: sep) collect: #trim) removeAllSuchThat: #isEmpty ]
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> inputLabel [
	^ inputLabel
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> letterPanel [
	^ letterPanel
]

{ #category : #actions }
OPFsmSimulator >> nextAction [
	nextButton disable.
	backButton disable.
	runButton disable.
	recognizer next
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> nextButton [
	^ nextButton
]

{ #category : #'instance creation' }
OPFsmSimulator >> openOn: aDiagramController [

	diagramController := aDiagramController.
	self open
]

{ #category : #actions }
OPFsmSimulator >> preconditions [
	diagramController model states
		detect: #isInitial
		ifNone: [ UIManager default abort: 'No initial state has been defined.'.
			^ false ].
	(diagramController model states detect: #isInitial) outgoing isEmpty
		ifTrue: [ UIManager default abort: 'No outgoing transitions from initial state.'.
			^ false ].
	^ true
]

{ #category : #actions }
OPFsmSimulator >> resetAction [
	diagramController model elements
		do: [ :each | OPFsmFigureHighlighter unhighlight: (diagramController figureForModel: each) ]
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> resetButton [
	^ resetButton
]

{ #category : #actions }
OPFsmSimulator >> runAction [
	nextButton disable.
	backButton disable.
	runButton disable.
	recognizer nextUpToEnd
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> runButton [
	^ runButton
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> separatorInput [
	^ separatorInput
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> separatorLabel [
	^ separatorLabel
]

{ #category : #actions }
OPFsmSimulator >> startAction [
	self preconditions
		ifFalse: [ ^ self ].
	self preconditions.
	input disable.
	separatorInput disable.
	startButton disable.
	stopButton enable.
	backButton disable.
	nextButton enable.
	runButton enable.
	self resetAction.
	recognizer
		input: self inputData
		startingAt: (diagramController model states detect: #isInitial).
	letterPanel data: self inputData
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> startButton [
	^ startButton
]

{ #category : #actions }
OPFsmSimulator >> stopAction [
	input enable.
	separatorInput enable.
	startButton enable.
	stopButton disable.
	backButton disable.
	nextButton disable.
	runButton disable.
	letterPanel data: ''
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> stopButton [
	^ stopButton
]

{ #category : #events }
OPFsmSimulator >> watchRecognizer: aRecognizer [

	aRecognizer when: OPFsmRecognizerEvent do: [ :ann | 
		aRecognizer isInputEmpty ifFalse: [ 
			nextButton enable.
			runButton enable ].
		aRecognizer isPathEmpty ifFalse: [ backButton enable ].
		(ann isKindOf: OPFsmRecognizerFailure) not & ann place isState 
			ifTrue: [ 
				self letterPanel
					changeBoxAt: aRecognizer inputPosition - 1
					to: #success ].
		ann place isTransition ifTrue: [ 
			self letterPanel
				changeBoxAt: aRecognizer inputPosition - 1
				to: #processed ] ].
	aRecognizer when: OPFsmRecognizerSuccess do: [ :ann | 
		OPFsmFigureHighlighter
			highlightElement: (diagramController figureForModel: ann place)
			with: Color green ].
	aRecognizer when: OPFsmRecognizerFailure do: [ :ann | 
		OPFsmFigureHighlighter
			highlightElement: (diagramController figureForModel: ann place)
			with: Color red.
		self letterPanel
			changeBoxAt: aRecognizer inputPosition - 1
			to: #failure ].
	aRecognizer when: OPFsmRecognizerLeave do: [ :ann | 
		OPFsmFigureHighlighter unhighlight:
			(diagramController figureForModel: ann place) ].
	aRecognizer when: OPFsmRecognizerEnter do: [ :ann | 
		OPFsmFigureHighlighter
			highlight: (diagramController figureForModel: ann place)
			with: Color orange ]
]
