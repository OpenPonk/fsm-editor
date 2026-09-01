"
Unit tests for OPFsmTransitionController and its integration with diagram elements.
Verifies valid connections between source and target states.
"
Class {
	#name : 'OPFsmTransitionControllerTest',
	#superclass : 'OPAbstractDirectionalRelationshipControllerTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPFsmTransitionControllerTest class >> diagramElementClass [

	^ OPFsmTransitionShape
]

{ #category : 'constants' }
OPFsmTransitionControllerTest >> controllerClass [
	^ OPFsmTransitionController
]

{ #category : 'constants' }
OPFsmTransitionControllerTest >> diagramControllerClass [

	^ OPFsmController
]

{ #category : 'constants' }
OPFsmTransitionControllerTest >> diagramModelClass [

	^ OPFsm
]

{ #category : 'running' }
OPFsmTransitionControllerTest >> fromClass [
	^ OPFsmInitialStateController
]

{ #category : 'constants' }
OPFsmTransitionControllerTest >> modelClass [
	^ OPFsmTransition
]

{ #category : 'constants' }
OPFsmTransitionControllerTest >> sourceControllerClass [

	^ OPFsmStateController
]

{ #category : 'constants' }
OPFsmTransitionControllerTest >> sourceModelClass [

	^ OPFsmState
]

{ #category : 'running' }
OPFsmTransitionControllerTest >> toClass [
	^ OPFsmFinalStateController
]
