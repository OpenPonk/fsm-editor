Class {
	#name : #OPFsmTransitionControllerTest,
	#superclass : #OPControllerOfFsmTest,
	#instVars : [
		'fromCtrl',
		'toCtrl'
	],
	#category : #'OpenPonk-FSM-Tests'
}

{ #category : #accessing }
OPFsmTransitionControllerTest >> controllerClass [
	^ OPFsmTransitionController
]

{ #category : #construction }
OPFsmTransitionControllerTest >> diagramElementClass [

	^ OPFsmTransitionShape
]

{ #category : #running }
OPFsmTransitionControllerTest >> fromClass [
	^ OPFsmInitialStateController
]

{ #category : #accessing }
OPFsmTransitionControllerTest >> modelClass [
	^ OPFsmTransition
]

{ #category : #running }
OPFsmTransitionControllerTest >> setUp [

	super setUp.
	fromCtrl := self fromClass new.
	diagramController addController: fromCtrl.
	fromCtrl createModelIn: diagramController model.
	fromCtrl
		createDiagramElement;
		renderDiagramElement.
	toCtrl := self toClass new.
	diagramController addController: toCtrl.
	toCtrl createModelIn: diagramController model.
	toCtrl model beFinal.
	toCtrl
		createDiagramElement;
		renderDiagramElement
]

{ #category : #tests }
OPFsmTransitionControllerTest >> testCreateDiagramElement [

	controller model: model.
	controller model source: fromCtrl model.
	controller model target: toCtrl model.

	super testCreateDiagramElement
]

{ #category : #tests }
OPFsmTransitionControllerTest >> testCreateFigure [

	| figure |
	controller
		source: fromCtrl;
		target: toCtrl;
		model: model.
	diagramController addController: controller.
	figure := controller
		          createDiagramElement;
		          renderDiagramElement;
		          roassalShape.
	self assert: figure class equals: OPRSPolyline.
	self assert: figure from equals: fromCtrl roassalShape.
	self assert: figure to equals: toCtrl roassalShape.
	self assert: diagramController canvas nodes size equals: 5.
	self assert: figure class equals: OPRSPolyline.
	self assert: figure color equals: Color black.
	self assert: figure markerEnd shape class equals: RSPolygon.
	self assert: figure border dashArray isNil
]

{ #category : #tests }
OPFsmTransitionControllerTest >> testCreateModel [
	| createdModel |
	controller source: fromCtrl.
	controller target: toCtrl.
	fromCtrl createModelIn: diagramController model.
	toCtrl createModelIn: diagramController model.
	createdModel := controller createModelIn: diagramController model.
	self assert: createdModel class equals: self modelClass.
	self assert: createdModel source equals: fromCtrl model.
	self assert: createdModel target equals: toCtrl model
]

{ #category : #tests }
OPFsmTransitionControllerTest >> testFigureRefresh [

	| label |
	controller
		source: fromCtrl;
		target: toCtrl.
	diagramController addController: controller.
	controller createModelIn: diagramController model.
	controller
		createDiagramElement;
		renderDiagramElement.
	self assert: controller diagramElement ownedElements size equals: 1.
	label := controller diagramElement ownedElements anyOne.
	self assert: label text equals: ''.
	controller model name: 'new name'.
	controller diagramElement modelChanged.
	self assert: label text equals: 'new name'
]

{ #category : #running }
OPFsmTransitionControllerTest >> toClass [
	^ OPFsmFinalStateController
]
