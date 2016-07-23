hooks
createFigure
	^ (DCFsmInitialStateFigure on: self model)
		controller: self;
		yourself