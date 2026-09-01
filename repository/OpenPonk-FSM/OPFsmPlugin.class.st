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
OPFsmPlugin >> diagramControllerClass [
	^ OPFsmController
]

{ #category : 'accessing' }
OPFsmPlugin >> icon [
	^ OPCoreIcons opFsmDiagramIcon
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
