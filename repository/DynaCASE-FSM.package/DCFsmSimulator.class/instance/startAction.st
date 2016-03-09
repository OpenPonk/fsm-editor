actions
startAction
	self preconditions
		ifFalse: [ ^ self ].
	self preconditions.
	input disable.
	startButton disable.
	stopButton enable.
	backButton disable.
	nextButton enable.
	self resetAction.
	recognizer
		input: self inputData
		startingAt: (diagramController model states detect: #isInitial).
	letterPanel widget data: self inputData