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
		input: input text
		startingAt: (diagramController model states detect: #isInitial).
	letterPanel widget data: input text