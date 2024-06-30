Class {
	#name : 'OPFsmInitialStateControllerTest',
	#superclass : 'OPFsmVertexControllerTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPFsmInitialStateControllerTest >> controllerClass [
	^ OPFsmInitialStateController
]

{ #category : 'construction' }
OPFsmInitialStateControllerTest >> diagramElementClass [

	^ OPFsmInitialStateShape
]

{ #category : 'hooks' }
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
