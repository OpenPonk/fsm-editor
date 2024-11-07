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

{ #category : 'announcements' }
OPFsmTransitionController >> internalSubscribeTo: aModel [

	super internalSubscribeTo: aModel.
	aModel weakWhen: OPElementRemoved send: #removeControllerAndDiagramElement to: self
]

{ #category : 'accessing' }
OPFsmTransitionController >> modelClass [
	^ OPFsmTransition
]

{ #category : 'destruction' }
OPFsmTransitionController >> removeModel [

	self diagramController model remove: self model.
	super removeModel
]
