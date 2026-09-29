"
Visual representation (Roassal shape) of an FSM transition edge on a diagram. Manages rendering logic, arrows, and label attachments.
"
Class {
	#name : 'OPFsmTransitionShape',
	#superclass : 'OPEdge',
	#category : 'OpenPonk-FSM-DiagramElements',
	#package : 'OpenPonk-FSM',
	#tag : 'DiagramElements'
}

{ #category : 'initialization' }
OPFsmTransitionShape >> createOwnedElementsWithoutController [

	self ownedElements ifNotEmpty: [ ^ self ].
	OPFsmTransitionLabel in: self
]

{ #category : 'rendering' }
OPFsmTransitionShape >> renderBasicShape [

	^ (self source = self target
		   ifTrue: [ OPRSBezier ]
		   ifFalse: [ OPRSPolyline ]) new
		  markerEnd: OPRSMarkerBuilder arrow;
		  attachPoint: (RSBorderAttachPoint new offset: -10);
		  controlPointsController: OPRSDraggableCPController new;
		  addInteraction: OPRSDraggableControlPoints;
		  color: Color black;
		  from: self source roassalShape;
		  to: self target roassalShape;
		  yourself
]
