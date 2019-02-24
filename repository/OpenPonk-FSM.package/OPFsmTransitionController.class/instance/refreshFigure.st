figures
refreshFigure
	self figure ifNil: [ ^ self ].
	self figure from = self figure to
		ifTrue: [ (figure labels at: #name)
				model: self model name;
				update ]
		ifFalse: [ (figure labels at: #name) trachelShape text: self model name ].
	super refreshFigure