Class {
	#name : #OPFsmLayouter,
	#superclass : #OPLayouter,
	#category : #'OpenPonk-FSM-Plugin'
}

{ #category : #accessing }
OPFsmLayouter >> allEdges [
	^ diagramController controllers
		select: [ :ctrl | ctrl isKindOf: OPFsmTransitionController ]
		thenCollect: #figure
]

{ #category : #accessing }
OPFsmLayouter >> allNodes [
	^ diagramController controllers
		select: [ :ctrl | ctrl isKindOf: OPFsmVertexController ]
		thenCollect: #figure
]

{ #category : #layouts }
OPFsmLayouter >> defaultLayout [
	self gridLayout
]
