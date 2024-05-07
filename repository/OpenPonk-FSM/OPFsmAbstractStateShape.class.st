"
I am a base class for FSM vertex figures and I provide basic adornment behavior.
"
Class {
	#name : 'OPFsmAbstractStateShape',
	#superclass : 'OPBoundNode',
	#instVars : [
		'adornmentCreationBlock'
	],
	#category : 'OpenPonk-FSM-Shapes',
	#package : 'OpenPonk-FSM',
	#tag : 'Shapes'
}

{ #category : 'accessing' }
OPFsmAbstractStateShape >> adornmentCreationBlock: aBlock [

	adornmentCreationBlock := aBlock
]

{ #category : 'hooks' }
OPFsmAbstractStateShape >> selectableInteraction [

	^ OPRSSelectable highlightAdornments: [ :builder |
		  builder horizontalLocation
			  outer;
			  right.
		  builder verticalLocation
			  inner;
			  middle.
		  builder directionDown.
		  adornmentCreationBlock value: builder ]
]

{ #category : 'rendering' }
OPFsmAbstractStateShape >> shouldBePositionableByUser [

	^ true
]
