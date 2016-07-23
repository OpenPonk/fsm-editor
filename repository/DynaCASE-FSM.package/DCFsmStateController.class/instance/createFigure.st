figures
createFigure
	^ (DCFsmStateFigure on: self model)
		controller: self;
		yourself