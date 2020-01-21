"
A DCFsmFinalStateController is a controller for the final state in FSM.
"
Class {
	#name : #OPFsmFinalStateController,
	#superclass : #OPFsmStateController,
	#category : 'OpenPonk-FSM-Controllers'
}

{ #category : #accessing }
OPFsmFinalStateController >> createModelIn: aParentModel [
	super createModelIn: aParentModel.
	model beFinal.
	^ model
]
