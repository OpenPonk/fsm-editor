Class {
	#name : #OPFsmStateControllerTest,
	#superclass : #OPFsmVertexControllerTest,
	#category : #'OpenPonk-FSM-Tests'
}

{ #category : #accessing }
OPFsmStateControllerTest >> controllerClass [
	^ OPFsmStateController
]

{ #category : #accessing }
OPFsmStateControllerTest >> modelClass [
	^ OPFsmState
]

{ #category : #tests }
OPFsmStateControllerTest >> testCreateFigure [
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller renderFigureIn: diagramController view.
	self assert: diagramController view elements size equals: 2.
	self assert: controller figure class equals: OPFsmStateFigure.
	self assert: controller figure shape class equals: RTEllipse.
	self assert: controller figure color equals: Color white.
	self assert: controller figure extent equals: 50 @ 50
]

{ #category : #tests }
OPFsmStateControllerTest >> testFigureRefresh [
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller renderFigureIn: diagramController view.
	self assert: controller figure model name equals: ''.
	controller model name: 'new name'.
	controller refreshFigure.
	self assert: controller figure ownedElements first trachelShape text equals: 'new name'
]
