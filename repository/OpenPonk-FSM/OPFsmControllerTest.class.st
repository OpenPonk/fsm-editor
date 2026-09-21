Class {
	#name : 'OPFsmControllerTest',
	#superclass : 'OPAbstractDiagramControllerTest',
	#category : 'OpenPonk-FSM-Controllers',
	#package : 'OpenPonk-FSM',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPFsmControllerTest >> controllerClass [
	^ OPFsmController
]

{ #category : 'accessing' }
OPFsmControllerTest >> diagramModelClass [
	^ OPFsm
]

{ #category : 'accessing' }
OPFsmControllerTest >> modelClass [
	^ OPFsm
]

{ #category : 'tests' }
OPFsmControllerTest >> testControllerFactory [
	self assert: controller controllerFactory isNotNil.
	self assert: (controller controllerFactory isKindOf: OPControllerFactory)
]

{ #category : 'tests' }
OPFsmControllerTest >> testInitializePalette [
	| palette |
	palette := OPPalette new.
	controller initializePalette: palette.
	self denyCollection: palette items hasSameElements: #()
]
