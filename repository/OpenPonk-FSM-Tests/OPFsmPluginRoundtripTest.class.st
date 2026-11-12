"
Verifies the serialization and deserialization roundtrip persistence for FSM models and diagrams.
"
Class {
	#name : 'OPFsmPluginRoundtripTest',
	#superclass : 'OPAbstractPluginExampleRoundtripTest',
	#category : 'OpenPonk-FSM-Tests-Plugin',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Plugin'
}

{ #category : 'accessing' }
OPFsmPluginRoundtripTest class >> pluginClass [
	^ OPFsmPlugin
]
