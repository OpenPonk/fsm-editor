hooks
createFigure
	^ (OPFsmInitialStateFigure on: self model)
		controller: self;
		yourself