Class {
	#name : #OPControllerOfFsmTest,
	#superclass : #OPControllerTest,
	#category : 'OpenPonk-FSM-Tests'
}

{ #category : #testing }
OPControllerOfFsmTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self name = #OPControllerOfFsmTest
]

{ #category : #accessing }
OPControllerOfFsmTest >> controllerClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
OPControllerOfFsmTest >> diagramModelClass [
	^ OPFsm
]

{ #category : #accessing }
OPControllerOfFsmTest >> modelClass [
	^ self subclassResponsibility
]

{ #category : #tests }
OPControllerOfFsmTest >> testClassSideModelClass [
	self assert: self controllerClass modelClass equals: self modelClass
]

{ #category : #tests }
OPControllerOfFsmTest >> testModelClass [
	self assert: controller modelClass equals: self modelClass
]
