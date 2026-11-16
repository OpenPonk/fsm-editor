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
OPFsmTest >> testEmptyExampleModel [

	| emptyModel |
	emptyModel := OPFsmExamples emptyModel.
	self assert: emptyModel class identicalTo: OPFsm.
	self assert: emptyModel name equals: 'New StateMachine Diagram'.
	self assertEmpty: emptyModel elements.
	self assertEmpty: emptyModel states.
	self assertEmpty: emptyModel transitions
]

{ #category : 'tests' }
OPFsmTest >> testLegacyIncomingTransitionAlias [

	| legacyTransition |
	self assert: OPFsmIncomingTransition isDeprecated description: 'OPFsmIncomingTransition must remain marked as deprecated'.
	legacyTransition := OPFsmIncomingTransition new.
	self assert: legacyTransition class identicalTo: OPFsmTransition.
	legacyTransition name: 'a,b'.
	self assert: (legacyTransition matches: 'a') description: 'Instantiated legacy transition alias must support matches:'
]

{ #category : 'tests' }
OPFsmTest >> testModelAndVertexPredicates [

	| bareVertex anotherTransition |
	self deny: diagram isState description: 'FSM diagram model must not report as a state'.
	self deny: diagram isTransition description: 'FSM diagram model must not report as a transition'.

	bareVertex := OPFsmVertex new.
	self deny: bareVertex isInitial description: 'Base vertex must not report as initial'.
	self deny: bareVertex isFinal description: 'Base vertex must not report as final'.
	self deny: bareVertex isNormal description: 'Base vertex must not report as normal'.
	self assert: bareVertex isState description: 'Base vertex must report as a state'.
	self deny: bareVertex isTransition description: 'Base vertex must not report as a transition'.

	self assert: initial isInitial description: 'Initial state must report as initial'.
	self deny: initial isFinal description: 'Initial state must not report as final'.
	self deny: initial isNormal description: 'Initial state must not report as normal'.

	self assert: state isNormal description: 'Newly created state must be normal'.
	self deny: state isFinal description: 'Newly created state must not be final'.
	self assert: final isFinal description: 'Final state must report as final'.
	self deny: final isNormal description: 'Final state must not report as normal'.

	final beNormal.
	self assert: final isNormal description: 'beNormal must clear final flag on state'.
	self deny: final isFinal description: 'beNormal must make isFinal false'.

	self assert: firstTransition isTransition description: 'Transition must report as a transition'.
	self deny: firstTransition isState description: 'Transition must not report as a state'.
	self assert: firstTransition asTransition identicalTo: firstTransition.
	self assert: firstTransition equals: firstTransition.
	self assert: (firstTransition represents: firstTransition) description: 'Transition must represent itself'.
	anotherTransition := OPFsmTransition from: initial to: state named: 'first'.
	self deny: firstTransition equals: anotherTransition.
	self deny: firstTransition = state description: 'Transition must not equal a state'.
	self deny: firstTransition = 'first' description: 'Transition must not equal a non-transition object'
]

{ #category : 'tests' }
OPFsmTest >> testRemoveState [

	diagram add: initial.
	diagram add: state.
	diagram add: final.
	diagram add: firstTransition.
	diagram add: secondTransition.

	state remove.
	self assert: state owner identicalTo: nil.
	self assert: firstTransition owner identicalTo: nil.
	self assert: firstTransition source identicalTo: nil.
	self assert: firstTransition target identicalTo: nil.
	self assert: secondTransition owner identicalTo: nil.
	self assert: secondTransition source identicalTo: nil.
	self assert: secondTransition target identicalTo: nil.
	self assertEmpty: initial outgoing.
	self assertEmpty: state incoming.
	self assertCollection: diagram elements hasSameElements: (Array with: initial with: final)
]

{ #category : 'tests' }
OPFsmTest >> testRemoveState2 [

	diagram add: state.
	diagram add: selfTransition.

	state remove.
	self assert: state owner identicalTo: nil.
	self assert: selfTransition owner identicalTo: nil.
	self assert: selfTransition source identicalTo: nil.
	self assert: selfTransition target identicalTo: nil.
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
	self assertCollection: diagram elements hasSameElements: (Array with: initial with: state with: firstTransition).

	firstTransition remove.
	self assert: diagram elements size equals: 2.
	self assertCollection: diagram elements hasSameElements: (Array with: initial with: state).
	self assert: firstTransition owner identicalTo: nil.
	self assert: firstTransition source identicalTo: nil.
	self assert: firstTransition target identicalTo: nil.
	self assertEmpty: initial outgoing.
	self assertEmpty: state incoming
]

{ #category : 'tests' }
OPFsmTest >> testTransition [

	diagram add: initial.
	diagram add: state.
	self assertEmpty: initial outgoing.
	self assertEmpty: state incoming.
	self assert: firstTransition owner identicalTo: nil.

	diagram add: firstTransition.
	self assert: firstTransition owner equals: diagram.
	self assertCollection: initial outgoing hasSameElements: { firstTransition }.
	self assertCollection: state incoming hasSameElements: { firstTransition }
]

{ #category : 'tests' }
OPFsmTest >> testTransitionMatchingAndCustomMatchBlock [

	| multiLabelTransition customTransition decimalModel digitTransition |
	multiLabelTransition := OPFsmTransition from: initial to: state named: '0,1,eps'.
	self assert: (multiLabelTransition matches: '0') description: 'Default matchBlock must match first comma-separated token'.
	self assert: (multiLabelTransition matches: '1') description: 'Default matchBlock must match middle comma-separated token'.
	self assert: (multiLabelTransition matches: 'eps') description: 'Default matchBlock must match last comma-separated token'.
	self deny: (multiLabelTransition matches: '2') description: 'Default matchBlock must reject unlisted token'.

	customTransition := OPFsmTransition from: state to: final named: 'digit'.
	customTransition matchBlock: [ :value | value = '42' ].
	self assert: (customTransition matches: '42') description: 'Custom matchBlock must match expected value'.
	self deny: (customTransition matches: 'digit') description: 'Custom matchBlock must override default name matching'.

	decimalModel := OPFsmExamples exampleDecimal.
	digitTransition := decimalModel transitions detect: [ :each | each name = 'd' ].
	self assert: (digitTransition matches: '5') description: 'Decimal example digit transition must match single digit'.
	self deny: (digitTransition matches: 'd') description: 'Decimal example digit transition must reject non-digit characters'
]

{ #category : 'tests' }
OPFsmTest >> testVertexRemovedFromDirectAndInvalidOwner [

	diagram
		add: initial;
		add: state;
		add: final;
		add: firstTransition;
		add: secondTransition;
		add: selfTransition.

	self should: [ state removedFrom: final ] raise: AssertionFailure.

	state removedFrom: diagram.
	self assert: state owner identicalTo: nil.
	self assert: firstTransition owner identicalTo: nil.
	self assert: secondTransition owner identicalTo: nil.
	self assert: selfTransition owner identicalTo: nil.
	self assert: firstTransition source identicalTo: nil.
	self assert: firstTransition target identicalTo: nil.
	self assert: secondTransition source identicalTo: nil.
	self assert: secondTransition target identicalTo: nil.
	self assert: selfTransition source identicalTo: nil.
	self assert: selfTransition target identicalTo: nil.
	self assertEmpty: initial outgoing.
	self assertEmpty: final incoming.
	self assertEmpty: diagram transitions
]
