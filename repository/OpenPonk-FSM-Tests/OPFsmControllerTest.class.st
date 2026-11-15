"
Tests diagram-level controller behaviors, element creation, and event handling for FSM diagrams.
"
Class {
	#name : 'OPFsmControllerTest',
	#superclass : 'OPAbstractDiagramControllerTest',
	#category : 'OpenPonk-FSM-Tests-Controllers',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Controllers'
}

{ #category : 'constants' }
OPFsmControllerTest >> controllerClass [

	^ OPFsmController
]

{ #category : 'constants' }
OPFsmControllerTest >> diagramModelClass [

	^ OPFsm
]

{ #category : 'constants' }
OPFsmControllerTest >> modelClass [

	^ OPFsm
]

{ #category : 'tests' }
OPFsmControllerTest >> testControllerFactory [

	| factory |
	factory := controller controllerFactory.
	self assert: factory class identicalTo: OPControllerFactory.
	self assert: (factory hasControllerFor: OPFsmInitialState new) description: 'Controller factory must register OPFsmInitialState'.
	self assert: (factory hasControllerFor: OPFsmState new) description: 'Controller factory must register OPFsmState'.
	self assert: (factory hasControllerFor: OPFsmTransition new) description: 'Controller factory must register OPFsmTransition'.
	self deny: (factory hasControllerFor: OPFsm new) description: 'Controller factory must not register diagram model OPFsm'.
	self assert: (factory newControllerFor: OPFsmInitialState new) class identicalTo: OPFsmInitialStateController.
	self assert: (factory newControllerFor: OPFsmState new) class identicalTo: OPFsmStateController.
	self assert: (factory newControllerFor: OPFsmTransition new) class identicalTo: OPFsmTransitionController
]

{ #category : 'tests' }
OPFsmControllerTest >> testInitializePalette [

	| palette entryLabels |
	palette := OPPalette new.
	controller initializePalette: palette.
	self assert: palette items size equals: 8.
	entryLabels := palette items select: [ :eachItem | eachItem class == OPPaletteEntry ] thenCollect: #label.
	self assert: entryLabels asArray equals: #( 'Select' 'Initial state' 'State' 'Final state' 'Transition' )
]
