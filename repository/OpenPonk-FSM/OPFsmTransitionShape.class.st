Class {
	#name : #OPFsmTransitionShape,
	#superclass : #OPEdge,
	#category : #'OpenPonk-FSM-DiagramElements'
}

{ #category : #'as yet unclassified' }
OPFsmTransitionShape >> renderBasicShape [

	^ OPRSPolyline new
		  markerEnd: OPRSMarkerBuilder arrow;
		  attachPoint: (RSBorderAttachPoint new offset: -10);
		  controlPointsController: OPRSPolylineCPController new;
		  addInteraction: OPRSPolylineHandles;
		  color: Color black;
		  from: self source roassalShape;
		  to: self target roassalShape;
		  yourself
]
