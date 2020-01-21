Class {
	#name : #OPFsmAdornment,
	#superclass : #RTAbstractMultiElement,
	#instVars : [
		'controller',
		'icon'
	],
	#category : 'OpenPonk-FSM-Figures'
}

{ #category : #'as yet unclassified' }
OPFsmAdornment >> baseShape [
	^ RTBox new
		size: 20;
		color: Color white;
		borderColor: Color veryVeryLightGray
]

{ #category : #'as yet unclassified' }
OPFsmAdornment >> on: aParentFigure [
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
]
