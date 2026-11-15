"
Unit tests for OPFsmStateController.
Verifies rendering logic and diagram lifecycle for standard states.
"
Class {
	#name : 'OPFsmStateControllerTest',
	#superclass : 'OPFsmVertexControllerTest',
	#category : 'OpenPonk-FSM-Tests-Controllers',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Controllers'
}

{ #category : 'constants' }
OPFsmStateControllerTest class >> diagramElementClass [

	^ OPFsmStateShape
]

{ #category : 'constants' }
OPFsmStateControllerTest >> controllerClass [
	^ OPFsmStateController
]

{ #category : 'constants' }
OPFsmStateControllerTest >> modelClass [
	^ OPFsmState
]

{ #category : 'tests' }
OPFsmStateControllerTest >> testCreateUsingAddAsTarget [

	super testCreateUsingAddAsTarget.
	self assert: controller roassalShape class identicalTo: RSCircle.
	self assert: controller roassalShape color equals: Color white.
	self assert: controller roassalShape extent equals: 61.5 @ 61.5
]

{ #category : 'tests' }
OPFsmStateControllerTest >> testFigureRefresh [

	| labelShapes |
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller
		createDiagramElement;
		renderDiagramElement.
	self assert: controller diagramElement modelElement name equals: ''.
	controller model name: 'new name'.
	controller modelChanged.
	labelShapes := controller diagramElement canvas allChildren select: [ :each | each class == RSLabel ].
	self assert: (labelShapes collect: #text as: Array) equals: #( 'new name' )
]
