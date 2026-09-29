"
Model representing an initial state in an FSM diagram.
"
Class {
	#name : 'OPFsmInitialState',
	#superclass : 'OPFsmVertex',
	#category : 'OpenPonk-FSM-Models',
	#package : 'OpenPonk-FSM',
	#tag : 'Models'
}

{ #category : 'DynaCASE-FSM-GraphML-accessing' }
OPFsmInitialState >> graphmlType [
	^ #initial
]

{ #category : 'testing' }
OPFsmInitialState >> isInitial [
	^ true
]
