"
Diagram element representing a label attached to an FSM transition edge.
Manages the textual rendering, anchoring, and positioning along the transition's underlying Roassal shape.
"
Class {
	#name : 'OPFsmTransitionLabel',
	#superclass : 'OPEdgeLabel',
	#category : 'OpenPonk-FSM-DiagramElements',
	#package : 'OpenPonk-FSM',
	#tag : 'DiagramElements'
}

{ #category : 'adding' }
OPFsmTransitionLabel >> defaultAnchorConstraintPosition [

	^ OPRSAnchorConstraintBalanceReference balance: 0.2
]

{ #category : 'adding' }
OPFsmTransitionLabel >> defaultMinDistance [

	^ 5
]

{ #category : 'accessing' }
OPFsmTransitionLabel >> defaultText [

	^ self modelElement name
]

{ #category : 'rendering' }
OPFsmTransitionLabel >> renderShapeDetails [

	super renderShapeDetails.
	self roassalShape
		when: RSMouseDoubleClick
		do: [ :evt | OPRenameElementCommand executeOn: self modelElement ]
		for: self
]
