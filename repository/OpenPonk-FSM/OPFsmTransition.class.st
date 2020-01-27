"
A DCFsmTransition is the class representing a transition in FSM.

Instance Variables
	source:		<Object>
	target:		<Object>

source
	- xxxxx

target
	- xxxxx

"
Class {
	#name : #OPFsmTransition,
	#superclass : #OPModelObject,
	#instVars : [
		'source',
		'target',
		'matchBlock'
	],
	#category : #'OpenPonk-FSM-Models'
}

{ #category : #'instance creation' }
OPFsmTransition class >> from: aSource to: aTarget [
	^ self new
		source: aSource;
		target: aTarget;
		yourself
]

{ #category : #'instance creation' }
OPFsmTransition class >> from: aSource to: aTarget named: aString [
	^ self new
		source: aSource;
		target: aTarget;
		name: aString;
		yourself
]

{ #category : #comparing }
OPFsmTransition >> = otherTransition [
	^ otherTransition isTransition
		and: [ otherTransition represents: self ]
]

{ #category : #removing }
OPFsmTransition >> detach [
	super detach.
	source := nil.
	target := nil
]

{ #category : #initialization }
OPFsmTransition >> initialize [
	super initialize.
	matchBlock := [ :aValue | (self name splitOn: ',') includes: aValue asString ]
]

{ #category : #testing }
OPFsmTransition >> isState [
	^ false
]

{ #category : #testing }
OPFsmTransition >> isTransition [
	^ true
]

{ #category : #accessing }
OPFsmTransition >> matchBlock [
	^ matchBlock
]

{ #category : #accessing }
OPFsmTransition >> matchBlock: aOneArgBlock [
	matchBlock := aOneArgBlock.
	self changed
]

{ #category : #testing }
OPFsmTransition >> matches: aValue [
	^ matchBlock value: aValue
]

{ #category : #comparing }
OPFsmTransition >> represents: otherTransition [
	^ super = otherTransition
]

{ #category : #accessing }
OPFsmTransition >> source [
	^ source
]

{ #category : #accessing }
OPFsmTransition >> source: aVertex [
	source := aVertex
]

{ #category : #accessing }
OPFsmTransition >> target [
	^ target
]

{ #category : #accessing }
OPFsmTransition >> target: aVertex [
	target := aVertex
]
