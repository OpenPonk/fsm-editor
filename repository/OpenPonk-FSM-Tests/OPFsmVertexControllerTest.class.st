"
Abstract base class for testing FSM vertex controllers (states and initial states).
"
Class {
	#name : 'OPFsmVertexControllerTest',
	#superclass : 'OPControllerOfFsmTest',
	#category : 'OpenPonk-FSM-Tests-Controllers',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Controllers'
}

{ #category : 'testing' }
OPFsmVertexControllerTest class >> isAbstract [
	^ self = OPFsmVertexControllerTest
]
