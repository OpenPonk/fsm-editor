rendering
renderFigureIn: aView
	figure := self
		createEdgeFrom: source figure
		to: target figure
		inView: aView.
	self diagramController figureAdded: figure.
	^ figure