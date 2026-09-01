"
A DCFsmController is a diagram controller for FSM. Manages the lifecycle of the FSM diagram, applies layouts, and initializes the palette.
"
Class {
	#name : 'OPFsmController',
	#superclass : 'OPDiagramController',
	#category : 'OpenPonk-FSM-Controllers',
	#package : 'OpenPonk-FSM',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPFsmController class >> viewModelClass [

	^ OPFsmViewModel
]

{ #category : 'userinterface' }
OPFsmController >> applyLayout: anAlgorithm [

	| roassalShapes edges |
	roassalShapes := self controllers
		           select: [ :each | each isKindOf: OPFsmVertexController ]
		           thenCollect: [ :each | each roassalShape ].
	edges := (roassalShapes flatCollect: #connectedLines) reject: [ :each |
		         each from = each to ].
	anAlgorithm on: roassalShapes asGroup edges: edges asGroup
]

{ #category : 'connecting' }
OPFsmController >> canBeTargetFor: aController [
	^ (super canBeTargetFor: aController)
		or: [ aController isKindOf: OPFsmVertexController ]
]

{ #category : 'accessing' }
OPFsmController >> controllerFactory [

	^ super controllerFactory
		  register: OPFsmInitialStateController forModel: OPFsmInitialState;
		  register: OPFsmStateController forModel: OPFsmState;
		  register: OPFsmTransitionController forModel: OPFsmTransition
]

{ #category : 'ui interaction' }
OPFsmController >> initializePalette: aPalette [
	aPalette
		newCreationTool: 'Initial state'
			factory: [ OPFsmInitialStateController new ]
			icon: OPCoreIcons opFsmInitialStateIcon;
		newSeparator;
		newCreationTool: 'State' factory: [ OPFsmStateController new ] icon: OPCoreIcons opFsmRegularStateIcon;
		newCreationTool: 'Final state'
			factory: [ OPFsmFinalStateController new ]
			icon: OPCoreIcons opFsmFinalStateIcon;
		newSeparator;
		newConnectionCreationTool: 'Transition'
			factory: [ OPFsmTransitionController new ]
			icon: OPCoreIcons opFsmTransitionIcon
]

{ #category : 'controllers management' }
OPFsmController >> newControllerFor: aModel [
	"IncomingTransition identifies itself as transition, but is not"

	^ super
		newControllerFor:
			(aModel isTransition
				ifTrue: [ aModel asTransition ]
				ifFalse: [ aModel ])
]
