initialization
initializePresenter
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