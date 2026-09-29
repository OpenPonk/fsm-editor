"
Abstract base class for testing FSM vertex controllers (states and initial states).
"
Class {
	#name : 'OPFsmVertexControllerTest',
	#superclass : 'OPControllerOfFsmTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'testing' }
OPFsmVertexControllerTest class >> isAbstract [
	^ self = OPFsmVertexControllerTest
]
