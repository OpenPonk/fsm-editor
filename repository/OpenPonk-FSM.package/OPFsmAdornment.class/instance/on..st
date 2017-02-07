as yet unclassified
on: aParentFigure
	(RTConstraint on: self background: aParentFigure)
		bottom;
		right;
		outer;
		stick.
	self
		when: OPTRFocused
		do: [ aParentFigure add: self.
			aParentFigure view add: self ].
	self
		when: OPTRUnfocused
		do: [ self view
				ifNotNil: [ aParentFigure remove: self.
					self remove ] ]