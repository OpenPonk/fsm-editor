"
I am descriptior for FSM plugin. Maps top-level controllers, models, view models, and serializers for the OpenPonk framework.
"
Class {
	#name : 'OPFsmPlugin',
	#superclass : 'OPPlugin',
	#category : 'OpenPonk-FSM-Plugin',
	#package : 'OpenPonk-FSM',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OPFsmPlugin class >> repositoryName [
	^ #'fsm-editor'
]

{ #category : 'accessing' }
OPFsmPlugin >> diagramControllerClass [
	^ OPFsmController
]

{ #category : 'templates' }
OPFsmPlugin >> exampleProjectTemplates [
	"Answers example project templates for FSM diagrams."

	^ { 
		(OPProjectTemplate
			named: 'Decimal'
			icon: self icon
			modelFactory: [ OPFsmExamples exampleDecimal ]
			isExample: true).
		(OPProjectTemplate
			named: 'Divisibility'
			icon: self icon
			modelFactory: [ OPFsmExamples exampleDivisibility ]
			isExample: true) }
]

{ #category : 'accessing' }
OPFsmPlugin >> icon [
	^ OPFsmIcons opFsmDiagramIcon
]

{ #category : 'accessing' }
OPFsmPlugin >> layouterClass [
	^ OPFsmLayouter
]

{ #category : 'accessing' }
OPFsmPlugin >> modelClass [
	^ OPFsm
]

{ #category : 'accessing' }
OPFsmPlugin >> modelSerializerClass [
	^ OPFsmModelSerializer
]

{ #category : 'accessing' }
OPFsmPlugin >> name [
	^ 'FSM Diagram'
]

{ #category : 'testing' }
OPFsmPlugin >> supportsHidingElements [
	^ true
]
