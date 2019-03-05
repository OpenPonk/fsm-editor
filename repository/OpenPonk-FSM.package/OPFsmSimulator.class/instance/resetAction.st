actions
resetAction
	diagramController model elements
		do: [ :each | OPFsmFigureHighlighter unhighlight: (diagramController figureForModel: each) ]