"
A DCFsmInitialStateController is a controller for the initial state in FSM.

"
Class {
	#name : #OPFsmInitialStateController,
	#superclass : #OPFsmVertexController,
	#category : 'OpenPonk-FSM-Controllers'
}

{ #category : #testing }
OPFsmInitialStateController >> canBeTargetFor: aController [
	^ false
]

{ #category : #hooks }
OPFsmInitialStateController >> createFigure [
	^ (OPFsmInitialStateFigure on: self model)
		controller: self;
		yourself
]

{ #category : #accessing }
OPFsmInitialStateController >> modelClass [
	^ OPFsmInitialState
]
