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
	^ aController isKindOf: OPFsmVertexController
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
			icon: OPIcons current dcFsmInitialStateIcon;
		newSeparator;
		newCreationTool: 'State' factory: [ OPFsmStateController new ] icon: OPIcons current dcFsmRegularStateIcon;
		newCreationTool: 'Final state'
			factory: [ OPFsmFinalStateController new ]
			icon: OPIcons current dcFsmFinalStateIcon;
		newSeparator;
		newConnectionCreationTool: 'Transition'
			factory: [ OPFsmTransitionController new ]
			icon: OPIcons current dcFsmTransitionIcon
]

{ #category : #accessing }
OPFsmController >> modelClass [
	^ OPFsm
]

{ #category : #accessing }
OPFsmController >> modelToControllerMapping [
	^ Dictionary new
		at: OPFsmInitialState put: OPFsmInitialStateController;
		at: OPFsmState put: OPFsmStateController;
		at: OPFsmTransition put: OPFsmTransitionController;
		at: OPFsmIncomingTransition put: OPFsmTransitionController;
		yourself
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
