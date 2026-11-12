"
Integration tests ensuring that the FSM divisibility example model correctly serializes and materializes.
"
Class {
	#name : 'OPFsmDivisibilityExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-FSM-Tests-Examples',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Examples'
}

{ #category : 'hooks' }
OPFsmDivisibilityExamplePersistenceTest >> createExampleModel [

	^ OPFsmExamples exampleDivisibility
]
