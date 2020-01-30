Class {
	#name : #OPFsmIncomingTransition,
	#superclass : #Object,
	#instVars : [
		'transition'
	],
	#category : #'OpenPonk-FSM-Adapters'
}

{ #category : #'instance creation' }
OPFsmIncomingTransition class >> of: aTransition [
	^ self ofTransition: aTransition
]

{ #category : #'instance creation' }
OPFsmIncomingTransition class >> ofTransition: aTransition [
	^ self new
		transition: aTransition;
		yourself
]

{ #category : #comparing }
OPFsmIncomingTransition >> = otherTransition [
	^ self represents: otherTransition
]

{ #category : #converting }
OPFsmIncomingTransition >> asTransition [
	^ transition
]

{ #category : #printing }
OPFsmIncomingTransition >> changed [
	^ transition changed
]

{ #category : #'reflective operations' }
OPFsmIncomingTransition >> doesNotUnderstand: aMessage [
	^ aMessage sendTo: transition
]

{ #category : #comparing }
OPFsmIncomingTransition >> hash [
	^ transition hash
]

{ #category : #printing }
OPFsmIncomingTransition >> printOn: aStream [
	^ transition printOn: aStream
]

{ #category : #comparing }
OPFsmIncomingTransition >> represents: otherTransition [
	^ super = otherTransition or: [ transition == otherTransition ]
]

{ #category : #accessing }
OPFsmIncomingTransition >> transition: aTransition [
	transition := aTransition
]

{ #category : #printing }
OPFsmIncomingTransition >> when: anAnnouncementClass send: aSelector to: anObject [
	^ transition when: anAnnouncementClass send: aSelector to: anObject
]
