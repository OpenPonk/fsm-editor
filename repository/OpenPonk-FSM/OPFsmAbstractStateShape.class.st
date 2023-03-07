"
I am a base class for FSM vertex figures and I provide basic adornment behavior.
"
Class {
	#name : #OPFsmAbstractStateShape,
	#superclass : #OPShape,
	#instVars : [
		'adornmentCreationBlock'
	],
	#category : #'OpenPonk-FSM-DiagramElements'
}

{ #category : #accessing }
OPFsmAbstractStateShape >> adornmentCreationBlock: aBlock [

	adornmentCreationBlock := aBlock
]

{ #category : #rendering }
OPFsmAbstractStateShape >> renderShapeDetails [

	| selectable |
	"self createAdornment.
	self createVertexAdornment."
	selectable := OPRSSelectable new.
	self setupHighlight: selectable.
	self roassalShape @ selectable.
	self roassalShape @ OPRSSelectionDraggable
]

{ #category : #hooks }
OPFsmAbstractStateShape >> setupHighlight: aHighlightable [

	aHighlightable highlightAdornments: [ :builder | 
		builder horizontalLocation
			outer;
			right.
		builder verticalLocation
			inner;
			middle.
		builder directionDown.
		adornmentCreationBlock value: builder ]
]
