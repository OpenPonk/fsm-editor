initialization
initializePalette: aPalette
	aPalette
		newCreationTool: 'Initial state'
			factory: [ OPFsmInitialStateController new ]
			icon: OPIcons current dcFsmInitialStateIcon;
		newSeparator;
		newCreationTool: 'State' factory: [ OPFsmStateController new ] icon: OPIcons current dcFsmRegularStateIcon;
		newCreationTool: 'Final state'
			factory: [ OPFsmFinalStateController new ]
			icon: OPIcons current dcFsmFinalStateIcon;
		newSeparator;
		newConnectionCreationTool: 'Transition'
			factory: [ OPFsmTransitionController new ]
			icon: OPIcons current dcFsmTransitionIcon