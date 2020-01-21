Class {
	#name : #OPFsmInitialStateControllerTest,
	#superclass : #OPFsmVertexControllerTest,
	#category : 'OpenPonk-FSM-Tests'
}

{ #category : #accessing }
OPFsmInitialStateControllerTest >> controllerClass [
	^ OPFsmInitialStateController
]

{ #category : #hooks }
OPFsmInitialStateControllerTest >> modelClass [
	^ OPFsmInitialState
]

{ #category : #tests }
OPFsmInitialStateControllerTest >> testCreateFigure [
	super testCreateFigure.
	self assert: controller figure shape class equals: RTEllipse.
	self assert: controller figure color equals: Color black.
	self assert: controller figure extent equals: 14 @ 14
]
