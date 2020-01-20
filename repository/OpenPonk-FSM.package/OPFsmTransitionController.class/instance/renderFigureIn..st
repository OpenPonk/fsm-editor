rendering
renderFigureIn: aView
	figure := self
		createEdgeFrom: self source figure
		to: self target figure.
	figure renderIn: aView.
	self addLabels.
	self diagramController figureAdded: figure.
	^ figure