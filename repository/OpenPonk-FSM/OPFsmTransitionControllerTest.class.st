Class {
	#name : #OPFsmTransitionControllerTest,
	#superclass : #OPControllerOfFsmTest,
	#instVars : [
		'fromCtrl',
		'toCtrl'
	],
	#category : 'OpenPonk-FSM-Tests'
}

{ #category : #accessing }
OPFsmTransitionControllerTest >> controllerClass [
	^ OPFsmTransitionController
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
	fromCtrl renderFigureIn: diagramController view.
	toCtrl := self toClass new.
	diagramController addController: toCtrl.
	toCtrl createModelIn: diagramController model.
	toCtrl model beFinal.
	toCtrl renderFigureIn: diagramController view
]

{ #category : #tests }
OPFsmTransitionControllerTest >> testCreateFigure [
	| figure |
	controller
		source: fromCtrl;
		target: toCtrl;
		model: model.
	diagramController addController: controller.
	figure := controller renderFigureIn: diagramController view.
	self assert: figure class equals: RTEdge.
	self assert: figure from equals: fromCtrl figure.
	self assert: figure to equals: toCtrl figure.
	self assert: diagramController view elements size equals: 5.
	self assert: figure shape class equals: OPRTStyledMultiLine.
	self assert: figure shape color equals: Color black.
	self assert: figure shape head shape equals: RTSimpleArrow.
	self assert: figure shape dashes isNil
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
	controller renderFigureIn: diagramController view.
	label := controller figure labels at: #name.
	self assert: label trachelShape text equals: ''.
	controller model name: 'new name'.
	controller refreshFigure.
	self assert: label trachelShape text equals: 'new name'
]

{ #category : #running }
OPFsmTransitionControllerTest >> toClass [
	^ OPFsmFinalStateController
]
