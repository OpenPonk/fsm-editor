figures
createFigure
	^ (OPFsmStateFigure on: self model)
		controller: self;
		yourself