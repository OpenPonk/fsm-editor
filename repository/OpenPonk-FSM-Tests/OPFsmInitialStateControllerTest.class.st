"
Unit tests for OPFsmInitialStateController.
Verifies diagram interactions and connection constraints for initial states.
"
Class {
	#name : 'OPFsmInitialStateControllerTest',
	#superclass : 'OPFsmVertexControllerTest',
	#category : 'OpenPonk-FSM-Tests-Controllers',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Controllers'
}

{ #category : 'constants' }
OPFsmInitialStateControllerTest class >> diagramElementClass [

	^ OPFsmInitialStateShape
]

{ #category : 'constants' }
OPFsmInitialStateControllerTest >> controllerClass [
	^ OPFsmInitialStateController
]

{ #category : 'constants' }
OPFsmInitialStateControllerTest >> modelClass [
	^ OPFsmInitialState
]

{ #category : 'tests' }
OPFsmInitialStateControllerTest >> testCreateUsingAddAsTarget [

	super testCreateUsingAddAsTarget.
	self assert: controller roassalShape class identicalTo: RSCircle.
	self assert: controller roassalShape color equals: Color black.
	self assert: controller roassalShape extent equals: 16 @ 16
]
