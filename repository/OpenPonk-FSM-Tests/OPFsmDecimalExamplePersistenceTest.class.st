"
Integration tests ensuring that the FSM decimal example model correctly serializes and materializes.
"
Class {
	#name : 'OPFsmDecimalExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-FSM-Tests-Examples',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Examples'
}

{ #category : 'hooks' }
OPFsmDecimalExamplePersistenceTest >> createExampleModel [

	^ OPFsmExamples exampleDecimal
]
