"
A DCFsmState is the class representing a state in FSM.

"
Class {
	#name : #OPFsmState,
	#superclass : #OPFsmVertex,
	#instVars : [
		'isFinal'
	],
	#category : 'OpenPonk-FSM-Models'
}

{ #category : #accessing }
OPFsmState >> beFinal [
	self isFinal: true
]

{ #category : #accessing }
OPFsmState >> beNormal [
	self isFinal: false
]

{ #category : #'DynaCASE-FSM-GraphML-accessing' }
OPFsmState >> graphmlType [
	self isFinal
		ifTrue: [ ^ #final ]
		ifFalse: [ ^ #regular ]
]

{ #category : #initialization }
OPFsmState >> initialize [
	super initialize.
	isFinal := false
]

{ #category : #testing }
OPFsmState >> isFinal [
	^ isFinal
]

{ #category : #accessing }
OPFsmState >> isFinal: aBoolean [
	isFinal := aBoolean.
	self changed
]

{ #category : #testing }
OPFsmState >> isNormal [
	^ isFinal not
]
