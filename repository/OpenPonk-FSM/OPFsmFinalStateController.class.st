"
A DCFsmFinalStateController is a controller for the final state in FSM.
"
Class {
	#name : 'OPFsmFinalStateController',
	#superclass : 'OPFsmStateController',
	#category : 'OpenPonk-FSM-Controllers',
	#package : 'OpenPonk-FSM',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPFsmFinalStateController >> createModelIn: aParentModel [

	^ (super createModelIn: aParentModel)
		  beFinal;
		  yourself
]
