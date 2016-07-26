initialization
initializeWidgets
	inputLabel := self newLabel.
	input := self newTextInput.
	separatorLabel := self newLabel.
	separatorInput := self newTextInput.
	startButton := self newButton.
	stopButton := self newButton.
	resetButton := self newButton.
	letterPanel := DCFsmTerminalPanel new asSpecAdapter.
	backButton := self newButton.
	nextButton := self newButton.
	runButton := self newButton