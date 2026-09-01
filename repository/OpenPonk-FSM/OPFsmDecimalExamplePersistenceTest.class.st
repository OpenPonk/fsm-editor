"
Integration tests ensuring that the FSM decimal example model correctly serializes and materializes.
"
Class {
	#name : 'OPFsmDecimalExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPFsmDecimalExamplePersistenceTest >> createExampleModel [

	^ OPFsmExamples exampleDecimal
]
