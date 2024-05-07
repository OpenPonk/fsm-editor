Class {
	#name : 'OPFsmTerminalRecognizerStateChanged',
	#superclass : 'Announcement',
	#instVars : [
		'inputPosition',
		'inputState'
	],
	#category : 'OpenPonk-FSM-Simulations',
	#package : 'OpenPonk-FSM',
	#tag : 'Simulations'
}

{ #category : 'instance creation' }
OPFsmTerminalRecognizerStateChanged class >> at: anInteger to: aString [

	^ self new
		  inputPosition: anInteger;
		  inputState: aString;
		  yourself
]

{ #category : 'accessing' }
OPFsmTerminalRecognizerStateChanged >> inputPosition [

	^ inputPosition
]

{ #category : 'accessing' }
OPFsmTerminalRecognizerStateChanged >> inputPosition: anInteger [

	inputPosition := anInteger
]

{ #category : 'accessing' }
OPFsmTerminalRecognizerStateChanged >> inputState [

	^ inputState
]

{ #category : 'accessing' }
OPFsmTerminalRecognizerStateChanged >> inputState: aString [

	inputState := aString
]
