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

{ #category : #'as yet unclassified' }
OPFsmController >> allShowableElements [
	"Should return all elements that could be directly hidden on diagram"

	^ (Set with: model) , self model elements
]

{ #category : #userinterface }
OPFsmController >> applyDefaultLayout [
	self
		applyLayout:
			(RTHorizontalTreeLayout new
				horizontalGap: 50;
				verticalGap: 50;
				doNotAttachPoint;
				yourself)
]

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
		yourself
]

{ #category : #rebuilding }
OPFsmController >> rebuild [
	super rebuild.
	self applyDefaultLayout
]

{ #category : #rebuilding }
OPFsmController >> showAllElements [
	model states , model transitions do: [ :each | self showModelInDiagram: each ]
]
