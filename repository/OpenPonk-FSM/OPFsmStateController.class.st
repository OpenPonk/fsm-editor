"
Controller for an FSM state.
Manages the diagram lifecycle, connections, and interactions for state nodes.
"
Class {
	#name : 'OPFsmStateController',
	#superclass : 'OPFsmVertexController',
	#category : 'OpenPonk-FSM-Controllers',
	#package : 'OpenPonk-FSM',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPFsmStateController class >> diagramElementClass [

	^ OPFsmStateShape
]

{ #category : 'accessing' }
OPFsmStateController class >> viewModelClass [
	^ OPFsmStateViewModel
]
