actions
resetAction
	diagramController model elements
		do: [ :each | OPFsmFigureHighlighter unhighlight: (diagramController figureFor: each) ]