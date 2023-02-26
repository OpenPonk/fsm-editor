"
A DCFsmVertexController is a controller for a vertex in FSM.

"
Class {
	#name : #OPFsmVertexController,
	#superclass : #OPElementController,
	#category : #'OpenPonk-FSM-Controllers'
}

{ #category : #testing }
OPFsmVertexController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and: [ aController modelClass = OPFsmTransition ]
]

{ #category : #testing }
OPFsmVertexController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : #accessing }
OPFsmVertexController >> dependentElements [
	^ (model incoming , model outgoing) asSet
]

{ #category : #announcements }
OPFsmVertexController >> internalSubscribeTo: aModel [
	super internalSubscribeTo: aModel.
	aModel when: OPElementRemoved do: [ :e | self removeController ]
]

{ #category : #testing }
OPFsmVertexController >> isHideable [
	^ true
]

{ #category : #adding }
OPFsmVertexController >> modelAsParent [
	^ self model owner
]

{ #category : #destruction }
OPFsmVertexController >> removeModel [
	self model announcer unsubscribe: self.
	self diagramController model remove: self model
]
