rendering
renderFigureIn: aView
	(figure := self createFigure) renderIn: aView.
	self diagramController figureAdded: figure.
	^ figure