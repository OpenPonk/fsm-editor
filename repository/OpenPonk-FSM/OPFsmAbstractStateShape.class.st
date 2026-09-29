"
I am a base class for FSM vertex figures and I provide basic adornment behavior.
"
Class {
	#name : 'OPFsmAbstractStateShape',
	#superclass : 'OPBoundNode',
	#instVars : [
		'adornmentCreationBlock'
	],
	#category : 'OpenPonk-FSM-DiagramElements',
	#package : 'OpenPonk-FSM',
	#tag : 'DiagramElements'
}

{ #category : 'accessing' }
OPFsmAbstractStateShape >> adornmentCreationBlock: aBlock [

	adornmentCreationBlock := aBlock
]

{ #category : 'interactions' }
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
