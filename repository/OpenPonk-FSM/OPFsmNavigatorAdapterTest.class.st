Class {
	#name : 'OPFsmNavigatorAdapterTest',
	#superclass : 'OPNavigatorAdaptersTest',
	#instVars : [
		'adapter',
		'fsm',
		'initialState',
		'state',
		'finalState',
		'firstTransition',
		'secondTransition'
	],
	#category : 'OpenPonk-FSM-Adapters',
	#package : 'OpenPonk-FSM',
	#tag : 'Adapters'
}

{ #category : 'accessing' }
OPFsmNavigatorAdapterTest >> adapterClass [
	^ OPFsmNavigatorAdapter
]

{ #category : 'asserting' }
OPFsmNavigatorAdapterTest >> childrenFor: anObject equals: aCollection [
	^ self assertCollection: (adapter childrenFor: anObject) hasSameElements: aCollection
]

{ #category : 'asserting' }
OPFsmNavigatorAdapterTest >> displayFor: anObject equals: aString [
	^ self assert: (adapter displayFor: anObject) equals: aString
]

{ #category : 'initialization' }
OPFsmNavigatorAdapterTest >> setUp [
	super setUp.
	adapter := self adapterClass new.
	fsm := OPFsm named: 'FSM'.
	initialState := OPFsmInitialState named: 'initial'.
	state := OPFsmState named: 'state'.
	finalState := OPFsmState named: 'final'.
	finalState beFinal.
	firstTransition := OPFsmTransition from: initialState to: state named: 'first'.
	secondTransition := OPFsmTransition from: state to: finalState named: 'second'.
	fsm
		add: initialState;
		add: state;
		add: finalState;
		add: firstTransition;
		add: secondTransition
]

{ #category : 'tests' }
OPFsmNavigatorAdapterTest >> testChildren [
	self
		childrenFor: fsm
		equals: (Array with: initialState with: state with: finalState).
	self childrenFor: initialState equals: {firstTransition}.
	self
		childrenFor: state
		equals:
			{firstTransition.
			secondTransition}
]

{ #category : 'tests' }
OPFsmNavigatorAdapterTest >> testDisplay [
	self displayFor: fsm equals: fsm name , ' (Diagram)'.
	self displayFor: initialState equals: initialState name , ' (Initial State)'.
	self displayFor: state equals: state name , ' (State)'.
	self displayFor: finalState equals: finalState name , ' (Final State)'.
	self displayFor: firstTransition equals: firstTransition name , ' (Transition)'
]
