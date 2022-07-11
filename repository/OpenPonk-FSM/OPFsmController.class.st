"
A DCFsmController is a diagram controller for FSM.

"
Class {
	#name : #OPFsmController,
	#superclass : #OPDiagramController,
	#instVars : [
		'persistenceManager'
	],
	#category : #'OpenPonk-FSM-Controllers'
}

{ #category : #userinterface }
OPFsmController >> applyLayout: anAlgorithm [
	| figures edges |
	figures := self controllers
		select: [ :each | each isKindOf: OPFsmVertexController ]
		thenCollect: #figure.
	edges := (figures flatCollect: #connectedEdges) reject: [ :each | each from = each to ].
	anAlgorithm on: figures edges: edges.
	self view canvas camera focusOnCenter
]

{ #category : #testing }
OPFsmController >> canBeTargetFor: aController [
	^ (super canBeTargetFor: aController)
		or: [ aController isKindOf: OPFsmVertexController ]
]

{ #category : #'as yet unclassified' }
OPFsmController >> commonModelClassPrefix [
	^ 'OPFsm'
]

{ #category : #accessing }
OPFsmController >> controllerFactory [
	^ super controllerFactory
		register: OPFsmInitialStateController forModel: OPFsmInitialState;
		register: OPFsmStateController forModel: OPFsmState;
		register: OPFsmTransitionController forModel: OPFsmTransition;
		register: OPFsmTransitionController
			forModel: OPFsmIncomingTransition
]

{ #category : #accessing }
OPFsmController >> elementsToShowInside [
	^ model elements
]

{ #category : #initialization }
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

{ #category : #accessing }
OPFsmController >> modelClass [
	^ OPFsm
]

{ #category : #'controllers management' }
OPFsmController >> newControllerFor: aModel [
	"IncomingTransition identifies itself as transition, but is not"

	^ super
		newControllerFor:
			(aModel isTransition
				ifTrue: [ aModel asTransition ]
				ifFalse: [ aModel ])
]
