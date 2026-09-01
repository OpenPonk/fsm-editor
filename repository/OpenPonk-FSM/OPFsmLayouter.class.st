"
Applies automated layout algorithms to FSM diagrams, positioning states and routing transitions for optimal readability.
"
Class {
	#name : 'OPFsmLayouter',
	#superclass : 'OPNodesAndEdgesLayouter',
	#category : 'OpenPonk-FSM-Plugin',
	#package : 'OpenPonk-FSM',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OPFsmLayouter >> allEdges [
	^ diagramController controllers
		select: [ :ctrl | ctrl isKindOf: OPFsmTransitionController ]
		thenCollect: #roassalShape
]

{ #category : 'accessing' }
OPFsmLayouter >> allNodes [
	^ diagramController controllers
		select: [ :ctrl | ctrl isKindOf: OPFsmVertexController ]
		thenCollect: #roassalShape
]

{ #category : 'layouts' }
OPFsmLayouter >> defaultLayout [
	self gridLayout
]
