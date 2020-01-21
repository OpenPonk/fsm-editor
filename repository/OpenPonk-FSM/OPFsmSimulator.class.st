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
	#superclass : #ComposableModel,
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
	#category : 'OpenPonk-FSM-Simulations'
}

{ #category : #specs }
OPFsmSimulator class >> defaultSpec [
	^ SpecColumnLayout composed
		newRow: [ :row | 
			row
				add: #inputLabel width: 50;
				add: #input;
				add: #separatorLabel width: 80;
				add: #separatorInput width: 60 ]
			height: 25;
		newRow: [ :row | 
			row
				add: #startButton;
				add: #stopButton;
				add: #resetButton ]
			height: self toolbarHeight;
		newRow: [ :row | row add: #letterPanel ] height: self toolbarHeight;
		newRow: [ :row | 
			row
				add: #backButton;
				add: #nextButton;
				add: #runButton;
				newColumn: [ :col |  ] ]
			height: self toolbarHeight;
		newRow: [ :row |  ];
		yourself
]

{ #category : #toolbar }
OPFsmSimulator class >> toolbarMenu: aBuilder [
	<opEditorToolbarMenu: #OPFsmPlugin>
	(aBuilder item: 'Open Simulator')
		action: [ OPFsmSimulator new openOn: aBuilder model diagramController ]
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

{ #category : #api }
OPFsmSimulator >> initialExtent [
	^ 400 @ 300
]

{ #category : #initialization }
OPFsmSimulator >> initialize [
	recognizer := OPFsmRecognizer new.
	self watchRecognizer: recognizer.
	super initialize
]

{ #category : #initialization }
OPFsmSimulator >> initializePresenter [
	super initializePresenter.
	inputLabel label: 'Input:'.
	input autoAccept: true.
	input textHolder
		whenChangedDo: [ :text | text ifEmpty: [ startButton disable ] ifNotEmpty: [ startButton enable ] ].
	separatorLabel label: 'Separated by:'.
	separatorInput autoAccept: true.
	separatorInput text: ','.
	startButton
		label: 'Start';
		icon: Smalltalk ui icons smallPrintItIcon;
		action: [ self startAction ];
		disable.
	stopButton
		label: 'Stop';
		icon: Smalltalk ui icons stopIcon;
		action: [ self stopAction ];
		disable.
	resetButton
		label: 'Reset';
		icon: Smalltalk ui icons smallUpdateIcon;
		action: [ self resetAction ].
	letterPanel widget data: ''.
	backButton
		label: 'Back';
		icon: Smalltalk ui icons backIcon;
		action: [ self backAction ];
		disable.
	nextButton
		label: 'Next';
		icon: Smalltalk ui icons forwardIcon;
		action: [ self nextAction ];
		disable.
	runButton
		label: 'Run';
		icon: Smalltalk ui icons smallPrintItIcon;
		action: [ self runAction ];
		disable
]

{ #category : #initialization }
OPFsmSimulator >> initializeWidgets [
	inputLabel := self newLabel.
	input := self newTextInput.
	separatorLabel := self newLabel.
	separatorInput := self newTextInput.
	startButton := self newButton.
	stopButton := self newButton.
	resetButton := self newButton.
	letterPanel := OPFsmTerminalPanel new asSpecAdapter.
	backButton := self newButton.
	nextButton := self newButton.
	runButton := self newButton
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
	self openWithSpec
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
	letterPanel widget data: self inputData
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
	letterPanel widget data: ''
]

{ #category : #'accessing - spec fields' }
OPFsmSimulator >> stopButton [
	^ stopButton
]

{ #category : #api }
OPFsmSimulator >> title [
	^ 'Finite State Machine Simulator'
]

{ #category : #events }
OPFsmSimulator >> watchRecognizer: aRecognizer [
	aRecognizer
		when: OPFsmRecognizerEvent
		do: [ :ann | 
			aRecognizer isInputEmpty
				ifFalse: [ nextButton enable.
					runButton enable ].
			aRecognizer isPathEmpty
				ifFalse: [ backButton enable ].
			(ann isKindOf: OPFsmRecognizerFailure) not & ann place isState
				ifTrue: [ self letterPanel widget changeBoxAt: aRecognizer inputPosition - 1 to: #beSuccess ].
			ann place isTransition
				ifTrue: [ self letterPanel widget changeBoxAt: aRecognizer inputPosition - 1 to: #beProcessed ] ].
	aRecognizer
		when: OPFsmRecognizerSuccess
		do: [ :ann | 
			OPFsmFigureHighlighter
				highlightElement: (diagramController figureForModel: ann place)
				with: Color green ].
	aRecognizer
		when: OPFsmRecognizerFailure
		do: [ :ann | 
			OPFsmFigureHighlighter
				highlightElement: (diagramController figureForModel: ann place)
				with: Color red.
			self letterPanel widget changeBoxAt: aRecognizer inputPosition - 1 to: #beFailure ].
	aRecognizer
		when: OPFsmRecognizerLeave
		do:
			[ :ann | OPFsmFigureHighlighter unhighlight: (diagramController figureForModel: ann place) ].
	aRecognizer
		when: OPFsmRecognizerEnter
		do: [ :ann | 
			OPFsmFigureHighlighter
				highlight: (diagramController figureForModel: ann place)
				with: Color orange ]
]
