actions
startAction
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