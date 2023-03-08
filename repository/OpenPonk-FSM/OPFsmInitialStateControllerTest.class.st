Class {
	#name : #OPFsmInitialStateControllerTest,
	#superclass : #OPFsmVertexControllerTest,
	#category : #'OpenPonk-FSM-Tests'
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
	self assert: (controller roassalShape isKindOf: RSCircularShape).
	self assert: controller roassalShape color equals: Color black.
	self assert: controller roassalShape extent equals: 14 @ 14
]
