"
I am a root class for all events fired by DCFsmRecognizer.

!! Collaboratrs

DCFsmRecognizer
"
Class {
	#name : 'OPFsmRecognizerEvent',
	#superclass : 'Announcement',
	#instVars : [
		'place'
	],
	#category : 'OpenPonk-FSM-Simulations',
	#package : 'OpenPonk-FSM',
	#tag : 'Simulations'
}

{ #category : 'instance creation' }
OPFsmRecognizerEvent class >> place: aPlace [
	^ self new
		place: aPlace;
		yourself
]

{ #category : 'accessing' }
OPFsmRecognizerEvent >> place [
	^ place
]

{ #category : 'accessing' }
OPFsmRecognizerEvent >> place: aStateOrTransition [
	place := aStateOrTransition
]
