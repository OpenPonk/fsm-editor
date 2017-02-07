accessing
modelToControllerMapping
	^ Dictionary new
		at: OPFsmInitialState put: OPFsmInitialStateController;
		at: OPFsmState put: OPFsmStateController;
		at: OPFsmTransition put: OPFsmTransitionController;
		yourself