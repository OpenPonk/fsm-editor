Class {
	#name : 'OPFsmTransitionLabel',
	#superclass : 'OPEdgeLabel',
	#category : 'OpenPonk-FSM-Shapes',
	#package : 'OpenPonk-FSM',
	#tag : 'Shapes'
}

{ #category : 'as yet unclassified' }
OPFsmTransitionLabel >> defaultAnchorConstraintPosition [

	^ OPRSAnchorConstraintBalanceReference balance: 0.2
]

{ #category : 'as yet unclassified' }
OPFsmTransitionLabel >> defaultMinDistance [

	^ 5
]

{ #category : 'as yet unclassified' }
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
