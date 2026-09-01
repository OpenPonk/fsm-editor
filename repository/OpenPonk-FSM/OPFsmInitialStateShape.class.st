"
Diagram element representing an FSM initial state.
Manages the rendering details and basic geometry of its underlying Roassal shape.
"
Class {
	#name : 'OPFsmInitialStateShape',
	#superclass : 'OPFsmAbstractStateShape',
	#category : 'OpenPonk-FSM-DiagramElements',
	#package : 'OpenPonk-FSM',
	#tag : 'DiagramElements'
}

{ #category : 'rendering' }
OPFsmInitialStateShape >> renderBasicShape [

	^ RSCircle new
		  size: 14;
		  color: Color black
]

{ #category : 'interactions' }
OPFsmInitialStateShape >> selectableInteraction [

	^ super selectableInteraction
		  highlightColor: Color blue;
		  yourself
]
