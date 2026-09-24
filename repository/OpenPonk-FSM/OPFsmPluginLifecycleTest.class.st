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
