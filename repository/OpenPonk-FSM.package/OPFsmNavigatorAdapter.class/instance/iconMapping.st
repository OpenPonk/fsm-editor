widget API
iconMapping
	^ {(OPFsm -> OPIcons current dcFsmDiagramIcon).
	(OPFsmInitialState -> OPIcons current dcFsmInitialStateIcon).
	(OPFsmTransition -> OPIcons current dcFsmTransitionIcon).
	(OPFsmState
		-> [ :o | 
			o isNormal
				ifTrue: [ OPIcons current dcFsmRegularStateIcon ]
				ifFalse: [ OPIcons current dcFsmFinalStateIcon ] ])}