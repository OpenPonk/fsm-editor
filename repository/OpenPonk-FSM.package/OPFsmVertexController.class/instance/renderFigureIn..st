rendering
renderFigureIn: aView
	(figure := self createFigure) renderIn: self diagramController view.
	self diagramController figureAdded: figure.
	^ figure