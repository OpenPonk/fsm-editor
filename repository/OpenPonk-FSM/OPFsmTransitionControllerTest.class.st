Class {
	#name : 'OPFsmTransitionControllerTest',
	#superclass : 'OPAbstractDirectionalRelationshipControllerTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPFsmTransitionControllerTest >> controllerClass [
	^ OPFsmTransitionController
]

{ #category : 'accessing' }
OPFsmTransitionControllerTest >> diagramControllerClass [

	^ OPFsmController
]

{ #category : 'construction' }
OPFsmTransitionControllerTest >> diagramElementClass [

	^ OPFsmTransitionShape
]

{ #category : 'accessing' }
OPFsmTransitionControllerTest >> diagramModelClass [

	^ OPFsm
]

{ #category : 'running' }
OPFsmTransitionControllerTest >> fromClass [
	^ OPFsmInitialStateController
]

{ #category : 'accessing' }
OPFsmTransitionControllerTest >> modelClass [
	^ OPFsmTransition
]

{ #category : 'as yet unclassified' }
OPFsmTransitionControllerTest >> sourceControllerClass [

	^ OPFsmStateController
]

{ #category : 'accessing' }
OPFsmTransitionControllerTest >> sourceModelClass [

	^ OPFsmState
]

{ #category : 'running' }
OPFsmTransitionControllerTest >> toClass [
	^ OPFsmFinalStateController
]
