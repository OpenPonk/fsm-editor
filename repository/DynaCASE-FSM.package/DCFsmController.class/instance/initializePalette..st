initialization
initializePalette: aPalette
	aPalette
		newCreationTool: 'Initial state'
			factory: [ DCFsmInitialStateController new ]
			icon: DCIcons current dcFsmInitialStateIcon;
		newSeparator;
		newCreationTool: 'State' factory: [ DCFsmStateController new ] icon: DCIcons current dcFsmRegularStateIcon;
		newCreationTool: 'Final state'
			factory: [ DCFsmFinalStateController new ]
			icon: DCIcons current dcFsmFinalStateIcon;
		newSeparator;
		newConnectionCreationTool: 'Transition'
			factory: [ DCFsmTransitionController new ]
			icon: DCIcons current dcFsmTransitionIcon