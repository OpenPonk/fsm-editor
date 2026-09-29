"
Model representing a transition in an FSM diagram.
Connects a source state to a target state and defines the matching conditions (input symbols) for traversal.
"
Class {
	#name : 'OPFsmTransition',
	#superclass : 'OPDirectedAssociation',
	#instVars : [
		'matchBlock'
	],
	#category : 'OpenPonk-FSM-Models',
	#package : 'OpenPonk-FSM',
	#tag : 'Models'
}

{ #category : 'comparing' }
OPFsmTransition >> = otherTransition [
	^ (otherTransition respondsTo: #isTransition)
		and: [ otherTransition isTransition
				and: [ otherTransition represents: self ] ]
]

{ #category : 'converting' }
OPFsmTransition >> asTransition [
	^ self
]

{ #category : 'removing' }
OPFsmTransition >> detach [
	super detach.
	source := nil.
	target := nil
]

{ #category : 'initialization' }
OPFsmTransition >> initialize [
	super initialize.
	matchBlock := [ :aValue | (self name splitOn: ',') includes: aValue asString ]
]

{ #category : 'testing' }
OPFsmTransition >> isState [
	^ false
]

{ #category : 'testing' }
OPFsmTransition >> isTransition [
	^ true
]

{ #category : 'accessing' }
OPFsmTransition >> matchBlock [
	^ matchBlock
]

{ #category : 'accessing' }
OPFsmTransition >> matchBlock: aOneArgBlock [
	matchBlock := aOneArgBlock.
	self changed
]

{ #category : 'testing' }
OPFsmTransition >> matches: aValue [
	^ matchBlock value: aValue
]

{ #category : 'comparing' }
OPFsmTransition >> represents: otherTransition [
	^ super = otherTransition
]
