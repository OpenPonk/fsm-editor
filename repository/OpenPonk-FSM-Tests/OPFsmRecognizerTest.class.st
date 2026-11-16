"
Verifies deterministic step-by-step finite-state machine recognition, backtracking, reset behavior, and recognizer announcement events.
"
Class {
	#name : 'OPFsmRecognizerTest',
	#superclass : 'TestCase',
	#instVars : [
		'recognizer',
		'recordedEvents',
		'divisibilityModel',
		'decimalModel'
	],
	#category : 'OpenPonk-FSM-Tests-Simulations',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Simulations'
}

{ #category : 'helpers' }
OPFsmRecognizerTest >> initialStateOf: aModel [

	^ aModel states detect: #isInitial
]

{ #category : 'running' }
OPFsmRecognizerTest >> setUp [

	super setUp.
	recognizer := OPFsmRecognizer new.
	recordedEvents := OrderedCollection new.
	recognizer when: OPFsmRecognizerEvent do: [ :event | recordedEvents add: event ] for: self.
	divisibilityModel := OPFsmExamples exampleDivisibility.
	decimalModel := OPFsmExamples exampleDecimal
]

{ #category : 'helpers' }
OPFsmRecognizerTest >> stateNamed: aName in: aModel [

	^ aModel states detect: [ :eachState | eachState name = aName ]
]

{ #category : 'running' }
OPFsmRecognizerTest >> tearDown [

	recognizer ifNotNil: [ :activeRecognizer | activeRecognizer unsubscribe: self ].
	recognizer := nil.
	recordedEvents := nil.
	divisibilityModel := nil.
	decimalModel := nil.
	super tearDown
]

{ #category : 'tests' }
OPFsmRecognizerTest >> testBackAndResumeNext [

	| initialDivisibility zeroState oneState twoState transOne |
	initialDivisibility := self initialStateOf: divisibilityModel.
	zeroState := self stateNamed: '%3=0' in: divisibilityModel.
	oneState := self stateNamed: '%3=1' in: divisibilityModel.
	twoState := self stateNamed: '%3=2' in: divisibilityModel.
	transOne := zeroState outgoing detect: [ :each | each name = '1' ].

	recognizer input: '10' startingAt: initialDivisibility.
	recordedEvents removeAll.
	recognizer back.
	self assertEmpty: recordedEvents.
	self assert: recognizer isPathEmpty description: 'Back on empty path must leave path empty'.

	3 timesRepeat: [ recognizer next ].
	self assert: recognizer inputPosition equals: 3.

	recordedEvents removeAll.
	recognizer back.
	self assert: (recordedEvents collect: #class as: Array) equals: {
			OPFsmRecognizerLeave.
			OPFsmRecognizerEnter }.
	self assert: recordedEvents last place identicalTo: oneState.
	self assert: recognizer inputPosition equals: 2.

	recordedEvents removeAll.
	recognizer back.
	self assert: recordedEvents last place identicalTo: transOne.
	self assert: recognizer inputPosition equals: 2.

	recordedEvents removeAll.
	recognizer back.
	self assert: recordedEvents last place identicalTo: zeroState.
	self assert: recognizer inputPosition equals: 1.
	self assert: recognizer isPathEmpty description: 'Stepping all the way back must empty path'.

	recordedEvents removeAll.
	5 timesRepeat: [ recognizer next ].
	self assert: recordedEvents last class identicalTo: OPFsmRecognizerFailure.
	self assert: recordedEvents last place identicalTo: twoState.

	recordedEvents removeAll.
	recognizer back.
	self assert: recordedEvents last class identicalTo: OPFsmRecognizerEnter.
	self assert: recordedEvents last place name equals: '0'
]

{ #category : 'tests' }
OPFsmRecognizerTest >> testDeterministicSuccessAndFailurePaths [

	| initialDivisibility zeroState oneState twoState initialDecimal stateK |
	initialDivisibility := self initialStateOf: divisibilityModel.
	zeroState := self stateNamed: '%3=0' in: divisibilityModel.
	oneState := self stateNamed: '%3=1' in: divisibilityModel.
	twoState := self stateNamed: '%3=2' in: divisibilityModel.

	recognizer input: '' startingAt: initialDivisibility.
	recordedEvents removeAll.
	recognizer next.
	self assert: (recordedEvents collect: #class as: Array) equals: { OPFsmRecognizerSuccess }.
	self assert: recordedEvents first place identicalTo: zeroState.
	recognizer next.
	self assert: (recordedEvents collect: #class as: Array) equals: {
			OPFsmRecognizerSuccess.
			OPFsmRecognizerSuccess }.

	recognizer input: '11' startingAt: initialDivisibility.
	recordedEvents removeAll.
	5 timesRepeat: [ recognizer next ].
	self assert: (recordedEvents collect: #class as: Array) equals: {
			OPFsmRecognizerLeave.
			OPFsmRecognizerEnter.
			OPFsmRecognizerLeave.
			OPFsmRecognizerEnter.
			OPFsmRecognizerLeave.
			OPFsmRecognizerEnter.
			OPFsmRecognizerLeave.
			OPFsmRecognizerEnter.
			OPFsmRecognizerSuccess }.
	self assert: recordedEvents last place identicalTo: zeroState.

	recognizer input: '10' startingAt: initialDivisibility.
	recordedEvents removeAll.
	5 timesRepeat: [ recognizer next ].
	self assert: recordedEvents last class identicalTo: OPFsmRecognizerFailure.
	self assert: recordedEvents last place identicalTo: twoState.
	self assert: recognizer inputPosition equals: 3.

	recognizer input: '23' startingAt: initialDivisibility.
	recordedEvents removeAll.
	recognizer next.
	self assert: (recordedEvents collect: #class as: Array) equals: { OPFsmRecognizerFailure }.
	self assert: recordedEvents first place identicalTo: zeroState.
	self assert: recognizer inputPosition equals: 2.
	recognizer next.
	self assert: recordedEvents last class identicalTo: OPFsmRecognizerFailure.
	self deny: oneState isFinal description: 'Intermediate divisibility state must not be final'.

	initialDecimal := self initialStateOf: decimalModel.
	stateK := self stateNamed: 'K' in: decimalModel.
	recognizer input: '-12.3' startingAt: initialDecimal.
	recordedEvents removeAll.
	11 timesRepeat: [ recognizer next ].
	self assert: recordedEvents last class identicalTo: OPFsmRecognizerSuccess.
	self assert: recordedEvents last place identicalTo: stateK
]

{ #category : 'tests' }
OPFsmRecognizerTest >> testInputConfigurationAndReset [

	| initialState zeroState |
	initialState := self initialStateOf: divisibilityModel.
	zeroState := self stateNamed: '%3=0' in: divisibilityModel.

	recognizer input: '10' startingAt: initialState.
	self assert: recognizer inputPosition equals: 1.
	self assert: recognizer isPathEmpty description: 'Path must be empty immediately after input initialization'.
	self deny: recognizer isInputEmpty description: 'Recognizer with remaining symbols must not report empty input'.
	self assert: recordedEvents size equals: 1.
	self assert: recordedEvents first class identicalTo: OPFsmRecognizerEnter.
	self assert: recordedEvents first place identicalTo: zeroState.

	recognizer next.
	self assert: recognizer inputPosition equals: 2.
	self deny: recognizer isPathEmpty description: 'Path must contain previous state after stepping onto transition'.
	self deny: recognizer isInputEmpty description: 'Recognizer positioned on a transition must not report empty input'.

	recordedEvents removeAll.
	recognizer input: '' startingAt: initialState.
	self assert: recognizer inputPosition equals: 1.
	self assert: recognizer isPathEmpty description: 'Reinitializing input must clear previous path'.
	self assert: recognizer isInputEmpty description: 'Empty input at starting state must report empty'.
	self assert: (recordedEvents collect: #class as: Array) equals: { OPFsmRecognizerEnter }.
	self assert: recordedEvents first place identicalTo: zeroState.

	recognizer reset.
	self assert: recognizer isPathEmpty description: 'Reset must clear recognizer path'.
	self assert: recognizer inputPosition equals: 1
]

{ #category : 'tests' }
OPFsmRecognizerTest >> testRecognizerEventAccessors [

	| state transition enterEvent leaveEvent successEvent failureEvent |
	state := OPFsmState named: 'S1'.
	transition := OPFsmTransition from: state to: state named: 'a'.

	enterEvent := OPFsmRecognizerEnter place: state.
	leaveEvent := OPFsmRecognizerLeave place: transition.
	successEvent := OPFsmRecognizerSuccess place: state.
	failureEvent := OPFsmRecognizerFailure place: state.

	self assert: enterEvent place identicalTo: state.
	self assert: leaveEvent place identicalTo: transition.
	self assert: successEvent place identicalTo: state.
	self assert: failureEvent place identicalTo: state.

	enterEvent place: transition.
	self assert: enterEvent place identicalTo: transition
]

{ #category : 'tests' }
OPFsmRecognizerTest >> testTransitionFailureFromFinalStateAtEndOfInput [

	| initialDivisibility zeroState initialDecimal stateC |
	initialDivisibility := self initialStateOf: divisibilityModel.
	zeroState := self stateNamed: '%3=0' in: divisibilityModel.

	recognizer input: '2' startingAt: initialDivisibility.
	recordedEvents removeAll.
	recognizer next.
	self assert: (recordedEvents collect: #class as: Array) equals: { OPFsmRecognizerFailure }.
	self assert: recordedEvents first place identicalTo: zeroState.
	self assert: recognizer inputPosition equals: 2.

	recognizer next.
	self assert: recordedEvents last class identicalTo: OPFsmRecognizerFailure.
	self assert: recordedEvents last place identicalTo: zeroState.

	recognizer back.
	self assert: recognizer inputPosition equals: 1.
	self deny: recognizer isInputEmpty description: 'Stepping back after failed transition must restore unconsumed symbol'.
	recordedEvents removeAll.
	recognizer next.
	self assert: recordedEvents last class identicalTo: OPFsmRecognizerFailure.

	initialDecimal := self initialStateOf: decimalModel.
	stateC := self stateNamed: 'C' in: decimalModel.
	recognizer input: '1a' startingAt: initialDecimal.
	recognizer next.
	recognizer next.
	recordedEvents removeAll.
	recognizer next.
	self assert: (recordedEvents collect: #class as: Array) equals: { OPFsmRecognizerFailure }.
	self assert: recordedEvents last place identicalTo: stateC.
	self assert: recognizer inputPosition equals: 3.

	recognizer next.
	self assert: recordedEvents last class identicalTo: OPFsmRecognizerFailure.

	recognizer back.
	self assert: recognizer inputPosition equals: 2.
	self deny: recognizer isInputEmpty description: 'Stepping back from failed symbol on decimal state C must restore symbol a'.
	recordedEvents removeAll.
	recognizer next.
	self assert: recordedEvents last class identicalTo: OPFsmRecognizerFailure
]
