figures
refreshFigure
	self figure from = self figure to
		ifTrue: [ (self figure attributeAt: self class name)
				model: self model name;
				update ]
		ifFalse: [ self figureLabel: #name text: self model name ].
	super refreshFigure