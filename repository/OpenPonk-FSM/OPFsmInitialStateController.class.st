"
A DCFsmInitialStateController is a controller for the initial state in FSM.

"
Class {
	#name : #OPFsmInitialStateController,
	#superclass : #OPFsmVertexController,
	#category : #'OpenPonk-FSM-Controllers'
}

{ #category : #testing }
OPFsmInitialStateController >> canBeTargetFor: aController [
	^ false
]

{ #category : #construction }
OPFsmInitialStateController >> diagramElementClass [

	^ OPFsmInitialStateShape
]

{ #category : #accessing }
OPFsmInitialStateController >> modelClass [
	^ OPFsmInitialState
]
