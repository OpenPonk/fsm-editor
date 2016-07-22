running
setUp
	super setUp.
	fromCtrl := DCFsmInitialStateController new.
	fromCtrl model: DCFsmInitialState new.
	toCtrl := DCFsmFinalStateController new.
	toCtrl model: DCFsmState new beFinal