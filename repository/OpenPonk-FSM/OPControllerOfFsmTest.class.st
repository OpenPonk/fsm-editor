Class {
	#name : 'OPControllerOfFsmTest',
	#superclass : 'OPAbstractElementControllerTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'testing' }
OPControllerOfFsmTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self name = #OPControllerOfFsmTest
]

{ #category : 'accessing' }
OPControllerOfFsmTest >> diagramControllerClass [

	^ OPFsmController
]

{ #category : 'accessing' }
OPControllerOfFsmTest >> diagramModelClass [
	^ OPFsm
]
