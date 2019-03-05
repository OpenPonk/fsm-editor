figures
refreshFigure
	self figure ifNil: [ ^ self ].
	(figure labels at: #name) trachelShape text: self model name.
	super refreshFigure