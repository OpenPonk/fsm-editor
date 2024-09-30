Class {
	#name : 'OPFsmDivisibilityExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPFsmDivisibilityExamplePersistenceTest >> createExampleModel [

	^ OPFsmExamples exampleDivisibility
]
