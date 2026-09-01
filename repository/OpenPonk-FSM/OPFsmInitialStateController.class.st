"
Controller for the initial state in an FSM diagram.
Manages diagram lifecycle and interactions for the starting node.
"
Class {
	#name : 'OPFsmInitialStateController',
	#superclass : 'OPFsmVertexController',
	#category : 'OpenPonk-FSM-Controllers',
	#package : 'OpenPonk-FSM',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPFsmInitialStateController class >> diagramElementClass [

	^ OPFsmInitialStateShape
]

{ #category : 'accessing' }
OPFsmInitialStateController class >> viewModelClass [
	^ OPFsmInitialStateViewModel
]

{ #category : 'connecting' }
OPFsmInitialStateController >> canBeTargetFor: aController [
	^ false
]
