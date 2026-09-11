Class {
	#name : 'OPFsmFinalStateControllerTest',
	#superclass : 'OPFsmStateControllerTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
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
