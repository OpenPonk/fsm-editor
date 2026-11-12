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
