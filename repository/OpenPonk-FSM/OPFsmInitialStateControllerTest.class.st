"
Unit tests for OPFsmInitialStateController.
Verifies diagram interactions and connection constraints for initial states.
"
Class {
	#name : 'OPFsmInitialStateControllerTest',
	#superclass : 'OPFsmVertexControllerTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
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
	self assert: (controller roassalShape isKindOf: RSCircularShape).
	self assert: controller roassalShape color equals: Color black.
	self assert: controller roassalShape extent equals: 14 @ 14
]
