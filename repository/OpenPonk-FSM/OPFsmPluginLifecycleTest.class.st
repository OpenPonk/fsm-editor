"
Verifies the initialization, registration, and shutdown lifecycle of the FSM plugin.
"
Class {
	#name : 'OPFsmPluginLifecycleTest',
	#superclass : 'OPAbstractPluginExampleLifecycleTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPFsmPluginLifecycleTest class >> pluginClass [
	"Answers the OPPlugin class under test."
	^ OPFsmPlugin
]
