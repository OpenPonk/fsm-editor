running
setUp
	super setUp.
	fromCtrl := OPFsmInitialStateController new.
	fromCtrl model: OPFsmInitialState new.
	toCtrl := OPFsmFinalStateController new.
	toCtrl model: OPFsmState new beFinal