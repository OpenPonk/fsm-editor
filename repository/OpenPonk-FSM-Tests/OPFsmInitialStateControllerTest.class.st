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
OPFsmInitialStateControllerTest >> testConnectionConstraints [

	| transitionController stateController |
	transitionController := OPFsmTransitionController new.
	stateController := OPFsmStateController new.
	self assert: (controller canBeSourceFor: transitionController) description: 'Initial state must allow outgoing transitions'.
	self
		deny: (controller canBeSourceFor: stateController)
		description: 'Initial state must reject non-transition source connections'.
	self deny: (controller canBeTargetFor: transitionController) description: 'Initial state must not allow incoming transitions'
]

{ #category : 'tests' }
OPFsmInitialStateControllerTest >> testCreateUsingAddAsTarget [

	super testCreateUsingAddAsTarget.
	self assert: controller roassalShape class identicalTo: RSCircle.
	self assert: controller roassalShape color equals: Color black.
	self assert: controller roassalShape extent equals: 16 @ 16
]
