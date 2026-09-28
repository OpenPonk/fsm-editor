"
Verifies the serialization and deserialization roundtrip persistence for FSM models and diagrams.
"
Class {
	#name : 'OPFsmPluginRoundtripTest',
	#superclass : 'OPAbstractPluginExampleRoundtripTest',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPFsmPluginRoundtripTest class >> pluginClass [
	^ OPFsmPlugin
]
