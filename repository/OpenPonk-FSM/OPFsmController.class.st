"
A DCFsmController is a diagram controller for FSM.

"
Class {
	#name : 'OPFsmController',
	#superclass : 'OPDiagramController',
	#instVars : [
		'persistenceManager'
	],
	#category : 'OpenPonk-FSM-Controllers',
	#package : 'OpenPonk-FSM',
	#tag : 'Controllers'
}

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

{ #category : 'testing' }
OPFsmController >> canBeTargetFor: aController [
	^ (super canBeTargetFor: aController)
		or: [ aController isKindOf: OPFsmVertexController ]
]

{ #category : 'as yet unclassified' }
OPFsmController >> commonModelClassPrefix [
	^ 'OPFsm'
]

{ #category : 'accessing' }
OPFsmController >> controllerFactory [

	^ super controllerFactory
		  register: OPFsmInitialStateController forModel: OPFsmInitialState;
		  register: OPFsmStateController forModel: OPFsmState;
		  register: OPFsmTransitionController forModel: OPFsmTransition
]

{ #category : 'accessing' }
OPFsmController >> elementsToShowInside [

	^ self model elements
]

{ #category : 'initialization' }
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
