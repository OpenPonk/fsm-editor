"
Model representing a generic state in an FSM diagram.
Can act as a normal state or be toggled to a final state.
"
Class {
	#name : 'OPFsmState',
	#superclass : 'OPFsmVertex',
	#instVars : [
		'isFinal'
	],
	#category : 'OpenPonk-FSM-Models',
	#package : 'OpenPonk-FSM',
	#tag : 'Models'
}

{ #category : 'actions' }
OPFsmState >> beFinal [
	self isFinal: true
]

{ #category : 'actions' }
OPFsmState >> beNormal [
	self isFinal: false
]

{ #category : 'DynaCASE-FSM-GraphML-accessing' }
OPFsmState >> graphmlType [
	self isFinal
		ifTrue: [ ^ #final ]
		ifFalse: [ ^ #regular ]
]

{ #category : 'initialization' }
OPFsmState >> initialize [
	super initialize.
	isFinal := false
]

{ #category : 'testing' }
OPFsmState >> isFinal [
	^ isFinal
]

{ #category : 'accessing' }
OPFsmState >> isFinal: aBoolean [
	isFinal := aBoolean.
	self changed
]

{ #category : 'testing' }
OPFsmState >> isNormal [
	^ isFinal not
]
