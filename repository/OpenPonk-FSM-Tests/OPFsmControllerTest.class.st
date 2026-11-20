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

	| palette entries entryLabels expectedFactories |
	palette := OPPalette new.
	controller initializePalette: palette.
	self assert: palette items size equals: 8.
	entries := palette items select: [ :eachItem | eachItem class == OPPaletteEntry ].
	entryLabels := entries collect: #label as: Array.
	self assert: entryLabels equals: #( 'Select' 'Initial state' 'State' 'Final state' 'Transition' ).

	expectedFactories := {
		                     ('Initial state' -> OPFsmInitialStateController).
		                     ('State' -> OPFsmStateController).
		                     ('Final state' -> OPFsmFinalStateController).
		                     ('Transition' -> OPFsmTransitionController) }.
	expectedFactories do: [ :eachPair |
			| entry |
			entry := entries detect: [ :eachEntry | eachEntry label = eachPair key ].
			entry performAction.
			self assert: (palette selectedTool instVarNamed: #controller) class identicalTo: eachPair value ]
]
