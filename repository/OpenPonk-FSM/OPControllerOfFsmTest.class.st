Class {
	#name : 'OPControllerOfFsmTest',
	#superclass : 'OPElementControllerTest',
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
OPControllerOfFsmTest >> controllerClass [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPControllerOfFsmTest >> diagramControllerClass [

	^ OPFsmController
]

{ #category : 'accessing' }
OPControllerOfFsmTest >> diagramModelClass [
	^ OPFsm
]

{ #category : 'accessing' }
OPControllerOfFsmTest >> modelClass [
	^ self subclassResponsibility
]

{ #category : 'tests' }
OPControllerOfFsmTest >> testModelClass [
	self assert: controller modelClass equals: self modelClass
]
