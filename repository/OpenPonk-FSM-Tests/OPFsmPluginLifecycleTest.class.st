"
Verifies the initialization, registration, and shutdown lifecycle of the FSM plugin.
"
Class {
	#name : 'OPFsmPluginLifecycleTest',
	#superclass : 'OPAbstractPluginExampleLifecycleTest',
	#category : 'OpenPonk-FSM-Tests-Plugin',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OPFsmPluginLifecycleTest class >> pluginClass [
	"Answers the OPPlugin class under test."
	^ OPFsmPlugin
]

{ #category : 'tests' }
OPFsmPluginLifecycleTest >> testPluginMetadataAndRepositoryName [

	| pluginInstance |
	self assert: OPFsmPlugin repositoryName equals: #'fsm-editor'.
	self deny: OPFsmPlugin isTestingOnly description: 'FSM plugin class must not be marked as testing only'.

	pluginInstance := self plugin.
	self assert: pluginInstance name equals: 'FSM Diagram'.
	self assert: pluginInstance modelClass identicalTo: OPFsm.
	self assert: pluginInstance diagramControllerClass identicalTo: OPFsmController.
	self assert: pluginInstance layouterClass identicalTo: OPFsmLayouter.
	self assert: pluginInstance modelSerializerClass identicalTo: OPFsmModelSerializer.
	self assert: pluginInstance supportsHidingElements description: 'FSM plugin must support hiding elements'.
	self assert: pluginInstance icon bits equals: OPFsmIcons opFsmDiagramIcon bits
]
