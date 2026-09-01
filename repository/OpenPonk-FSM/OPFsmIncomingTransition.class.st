"
Deprecated model representing an incoming transition in an FSM diagram.
Retained for backward compatibility.
"
Class {
	#name : 'OPFsmIncomingTransition',
	#superclass : 'OPFsmTransition',
	#category : 'OpenPonk-FSM-Models',
	#package : 'OpenPonk-FSM',
	#tag : 'Models'
}

{ #category : 'testing' }
OPFsmIncomingTransition class >> isDeprecated [

	^ true
]

{ #category : 'instance creation' }
OPFsmIncomingTransition class >> new [

	^ self superclass new
]
