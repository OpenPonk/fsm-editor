"
A DCFsmVertexController is a controller for a vertex in FSM.

"
Class {
	#name : #OPFsmVertexController,
	#superclass : #OPElementController,
	#category : #'OpenPonk-FSM-Controllers'
}

{ #category : #adding }
OPFsmVertexController >> addAsSourceFor: aTransitionController [
	self assert: (self canBeSourceFor: aTransitionController).
	aTransitionController source: self
]

{ #category : #adding }
OPFsmVertexController >> addAsTargetFor: aTransitionController [
	self assert: (self canBeTargetFor: aTransitionController).
	aTransitionController target: self.
	aTransitionController createModelIn: self model andShowInDiagram: self diagramController.
	self model owner add: aTransitionController model
]

{ #category : #testing }
OPFsmVertexController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and: [ aController modelClass = OPFsmTransition ]
]

{ #category : #testing }
OPFsmVertexController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : #deprecated }
OPFsmVertexController >> createFigure [
	^ self subclassResponsibility
]

{ #category : #announcements }
OPFsmVertexController >> internalSubscribeTo: aModel [
	super internalSubscribeTo: aModel.
	aModel when: OPElementRemoved do: [ :e | self removeController ]
]

{ #category : #destruction }
OPFsmVertexController >> removeModel [
	self diagramController model remove: self model
]

{ #category : #rendering }
OPFsmVertexController >> renderFigureIn: aView [
	(figure := self createFigure) renderIn: aView.
	self diagramController figureAdded: figure.
	^ figure
]
