"
I use FSM model to try to recognize an input string. Additionally events are fired upon reaching transitions and states that can be used for some highlighting or extra processing.

!! Responsibility

Recognizing an input string.
Firing events on state movements.

!! Collaborators

none
"
Class {
	#name : #OPFsmRecognizer,
	#superclass : #OPAnnouncableObject,
	#instVars : [
		'model',
		'input',
		'consumed',
		'path',
		'current',
		'canContinue'
	],
	#category : #'OpenPonk-FSM-Simulations'
}

{ #category : #stepping }
OPFsmRecognizer >> back [
	path ifEmpty: [ ^ self ].
	canContinue := true.
	self goTo: path pop.
	current isState
		ifTrue: [ input push: consumed pop ]
]

{ #category : #terminators }
OPFsmRecognizer >> beComplete [
	input isEmpty & current isFinal
		ifTrue: [ self beSuccess ]
		ifFalse: [ self beFailure ].
	canContinue := false
]

{ #category : #terminators }
OPFsmRecognizer >> beFailure [
	self announce: (OPFsmRecognizerFailure place: current)
]

{ #category : #terminators }
OPFsmRecognizer >> beSuccess [
	self announce: (OPFsmRecognizerSuccess place: current)
]

{ #category : #private }
OPFsmRecognizer >> goTo: aPlace [
	current ifNotNil: [ self announce: (OPFsmRecognizerLeave place: current) ].
	current := aPlace.
	self announce: (OPFsmRecognizerEnter place: current)
]

{ #category : #stepping }
OPFsmRecognizer >> input: aCollection startingAt: aState [
	self reset.
	aCollection reverseDo: [ :each | input push: each ].
	self goTo: aState outgoing anyOne target	"skip the initial state"
]

{ #category : #accessing }
OPFsmRecognizer >> inputPosition [
	^ consumed size + 1
]

{ #category : #testing }
OPFsmRecognizer >> isInputEmpty [
	^ current isState & input isEmpty
]

{ #category : #testing }
OPFsmRecognizer >> isPathEmpty [
	^ path isEmpty
]

{ #category : #stepping }
OPFsmRecognizer >> next [
	| transition |
	canContinue
		ifFalse: [ ^ self beComplete ].
	current isState & input isEmpty
		ifTrue: [ ^ self beComplete ].
	path push: current.
	current isTransition
		ifTrue: [ ^ self goTo: current target ].
	consumed push: input pop.
	transition := self transitionFrom: current using: consumed top.
	transition ifNil: [ ^ self beComplete ].
	self goTo: transition
]

{ #category : #stepping }
OPFsmRecognizer >> nextUpToEnd [
	[ canContinue ]
		whileTrue: [ self next.
			0 second asDelay wait.
			self currentWorld doOneCycle ]
]

{ #category : #initialization }
OPFsmRecognizer >> reset [
	path := Stack new.
	consumed := Stack new.
	input := Stack new.
	canContinue := true
]

{ #category : #private }
OPFsmRecognizer >> transitionFrom: aState using: aSymbol [
	^ aState outgoing detect: [ :each | each matches: aSymbol asString ] ifNone: [ nil ]
]
