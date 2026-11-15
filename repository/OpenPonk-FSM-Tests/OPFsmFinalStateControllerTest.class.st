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
	self assert: stateModel class identicalTo: OPFsmState.
	self assert: controller model identicalTo: stateModel.
	self assert: stateModel isFinal description: 'OPFsmFinalStateController must create a final OPFsmState'.
	self assertCollection: diagramController model states includesAll: { stateModel }
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
