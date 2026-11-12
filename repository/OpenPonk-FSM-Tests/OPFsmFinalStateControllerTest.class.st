"
Tests controller interactions, rendering, and lifecycle events for FSM final state elements.
"
Class {
	#name : 'OPFsmFinalStateControllerTest',
	#superclass : 'OPFsmStateControllerTest',
	#category : 'OpenPonk-FSM-Tests-Controllers',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Controllers'
}

{ #category : 'constants' }
OPFsmFinalStateControllerTest >> controllerClass [
	^ OPFsmFinalStateController
]

{ #category : 'tests' }
OPFsmFinalStateControllerTest >> testCreateModelInCreatesFinalState [
	| stateModel |
	stateModel := controller createModelIn: diagramController model.
	self assert: stateModel isFinal.
	self assert: controller model isFinal
]

{ #category : 'tests' }
OPFsmFinalStateControllerTest >> testRenderFinalStateShowsInnerCircle [
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller
		createDiagramElement;
		renderDiagramElement.
	self
		assert: (controller diagramElement attachedShapes detect: [ :s | s isKindOf: RSCircle ]) borderColor
		equals: Color black
]
