"
A DCFsmVertex is the class representing a vertex in FSM. Also parent class of all states.

"
Class {
	#name : 'OPFsmVertex',
	#superclass : 'OPModelObject',
	#category : 'OpenPonk-FSM-Models',
	#package : 'OpenPonk-FSM',
	#tag : 'Models'
}

{ #category : 'associating' }
OPFsmVertex >> -> aVertex [
	^ OPFsmTransition from: self to: aVertex
]

{ #category : 'DynaCASE-FSM-GraphML-accessing' }
OPFsmVertex >> graphmlType [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPFsmVertex >> incoming [
	owner ifNil: [ ^ #() ].
	^ owner transitions select: [ :each | each target = self ]
]

{ #category : 'testing' }
OPFsmVertex >> isFinal [
	^ false
]

{ #category : 'testing' }
OPFsmVertex >> isInitial [
	^ false
]

{ #category : 'testing' }
OPFsmVertex >> isNormal [
	^ false
]

{ #category : 'testing' }
OPFsmVertex >> isState [
	^ true
]

{ #category : 'testing' }
OPFsmVertex >> isTransition [
	^ false
]

{ #category : 'accessing' }
OPFsmVertex >> outgoing [
	owner ifNil: [ ^ #() ].
	^ owner transitions select: [ :each | each source = self ]
]

{ #category : 'accessing' }
OPFsmVertex >> relatedElements [
	^ (self incoming , self outgoing) asSet asOrderedCollection
]

{ #category : 'removing' }
OPFsmVertex >> removedFrom: aDiagram [
	self
		removedFrom: aDiagram
		do: [ 
			self incoming do: [ :each | aDiagram remove: each ].
			self outgoing do: [ :each | aDiagram remove: each ] ]
]
