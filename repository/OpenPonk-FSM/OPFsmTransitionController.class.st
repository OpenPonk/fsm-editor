"
A DCFsmTransitionController is a controller for a transition in FSM.

"
Class {
	#name : 'OPFsmTransitionController',
	#superclass : 'OPDirectionalRelationshipController',
	#category : 'OpenPonk-FSM-Controllers',
	#package : 'OpenPonk-FSM',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPFsmTransitionController >> diagramElementClass [

	^ OPFsmTransitionShape
]

{ #category : 'accessing' }
OPFsmTransitionController >> ensureSourceAndTargetIn: aDiagramController [

	source ifNil: [ 
		self source:
			(aDiagramController showWithoutDependentInDiagramModel:
				 model source) ].
	target ifNil: [ 
		self target:
			(aDiagramController showWithoutDependentInDiagramModel:
				 model target) ]
]

{ #category : 'announcements' }
OPFsmTransitionController >> internalSubscribeTo: aModel [

	super internalSubscribeTo: aModel.
	aModel when: OPElementRemoved send: #removeController to: self
]

{ #category : 'testing' }
OPFsmTransitionController >> isHideable [
	^ true
]

{ #category : 'accessing' }
OPFsmTransitionController >> modelClass [
	^ OPFsmTransition
]

{ #category : 'destruction' }
OPFsmTransitionController >> removeModel [
	self model announcer unsubscribe: self.
	self diagramController model remove: self model
]

{ #category : 'construction' }
OPFsmTransitionController >> showInDiagram: aDiagramController [

	self ensureSourceAndTargetIn: aDiagramController.
	^ super showInDiagram: aDiagramController
]

{ #category : 'construction' }
OPFsmTransitionController >> showWithoutDependentInDiagram: aDiagramController [

	self ensureSourceAndTargetIn: aDiagramController.
	^ super showWithoutDependentInDiagram: aDiagramController
]
