as yet unclassified
on: aParentFigure
	(RTConstraint on: self background: aParentFigure)
		bottom;
		right;
		outer;
		stick.
	self
		when: DCTRFocused
		do: [ aParentFigure add: self.
			aParentFigure view add: self ].
	self
		when: DCTRUnfocused
		do: [ self view
				ifNotNil: [ aParentFigure remove: self.
					self remove ] ]