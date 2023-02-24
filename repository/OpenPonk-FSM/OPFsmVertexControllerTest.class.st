Class {
	#name : #OPFsmVertexControllerTest,
	#superclass : #OPControllerOfFsmTest,
	#category : #'OpenPonk-FSM-Tests'
}

{ #category : #testing }
OPFsmVertexControllerTest class >> isAbstract [
	^ self = OPFsmVertexControllerTest
]

{ #category : #'testing - instance creation' }
OPFsmVertexControllerTest >> createController [
	^ super createController
		model: self modelClass new;
		yourself
]

{ #category : #tests }
OPFsmVertexControllerTest >> testCreateFigure [
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller renderFigureIn: diagramController view.
	self assert: diagramController view elements size equals: 1.
	self assert: controller figure class equals: OPFsmInitialStateShape
]

{ #category : #tests }
OPFsmVertexControllerTest >> testCreateModel [
	self assert: (controller createModelIn: diagramController model) class equals: self modelClass
]
