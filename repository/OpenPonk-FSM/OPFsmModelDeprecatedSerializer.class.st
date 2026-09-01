"
Deprecated serializer for older versions of FSM models.
Maintained for backward compatibility.
"
Class {
	#name : 'OPFsmModelDeprecatedSerializer',
	#superclass : 'OPFsmModelSerializer',
	#category : 'OpenPonk-FSM-Serialization',
	#package : 'OpenPonk-FSM',
	#tag : 'Serialization'
}

{ #category : 'accessing' }
OPFsmModelDeprecatedSerializer class >> fileExtensions [

	^ #( #ston )
]

{ #category : 'formatting' }
OPFsmModelDeprecatedSerializer class >> formatName [

	^ #'graphml-ston'
]
