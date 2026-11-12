"
Unit tests for the FSM model lifecycle.
Verifies the creation, addition, and removal of states and transitions within the diagram.
"
Class {
	#name : 'OPFsmTest',
	#superclass : 'TestCase',
	#instVars : [
		'diagram',
		'initial',
		'final',
		'state',
		'firstTransition',
		'secondTransition',
		'selfTransition'
	],
	#category : 'OpenPonk-FSM-Tests-Models',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Models'
}

{ #category : 'running' }
OPFsmTest >> setUp [

	super setUp.

	diagram := OPFsm named: 'Diagram'.
	initial := OPFsmInitialState named: 'initial'.
	(final := OPFsmState named: 'final') beFinal.
	state := OPFsmState named: 'state'.
	firstTransition := OPFsmTransition
		                   from: initial
		                   to: state
		                   named: 'first'.
	secondTransition := OPFsmTransition
		                    from: state
		                    to: final
		                    named: 'second'.
	selfTransition := OPFsmTransition from: state to: state named: 'self'
]

{ #category : 'tests' }
OPFsmTest >> testAdd [

	self assertEmpty: diagram elements.
	diagram add: initial.
	diagram add: state.
	diagram add: firstTransition.
	self assertCollection: diagram ownedElements hasSameElements: (Array with: initial with: firstTransition with: state).
	self assert: initial owner equals: diagram.
	self assert: state owner equals: diagram.
	self assertCollection: initial outgoing hasSameElements: { firstTransition }.
	self assertCollection: state incoming hasSameElements: { firstTransition }
]

{ #category : 'tests' }
OPFsmTest >> testRemoveState [

	diagram add: initial.
	diagram add: state.
	diagram add: final.
	diagram add: firstTransition.
	diagram add: secondTransition.

	state remove.
	self assert: state owner isNil.
	self assert: firstTransition source isNil.
	self assert: secondTransition source isNil.
	self assertEmpty: initial outgoing.
	self assertEmpty: state incoming.
	self assertCollection: diagram elements hasSameElements: (Array with: initial with: final)
]

{ #category : 'tests' }
OPFsmTest >> testRemoveState2 [

	diagram add: state.
	diagram add: selfTransition.

	state remove.
	self assert: state owner isNil.
	self assert: selfTransition source isNil.
	self assert: selfTransition target isNil.
	self assertEmpty: state outgoing.
	self assertEmpty: state incoming.
	self assertEmpty: diagram elements
]

{ #category : 'tests' }
OPFsmTest >> testRemoveTransition [

	diagram add: initial.
	diagram add: state.
	diagram add: firstTransition.

	self assert: diagram elements size equals: 3.

	firstTransition remove.
	self assert: diagram elements size equals: 2.
	self assertEmpty: initial outgoing.
	self assertEmpty: state incoming
]

{ #category : 'tests' }
OPFsmTest >> testTransition [

	diagram add: initial.
	diagram add: state.
	self assertEmpty: initial outgoing.
	self assertEmpty: state incoming.
	self assert: firstTransition owner isNil.

	diagram add: firstTransition.
	self assert: firstTransition owner equals: diagram.
	self assertCollection: initial outgoing hasSameElements: { firstTransition }.
	self assertCollection: state incoming hasSameElements: { firstTransition }
]
