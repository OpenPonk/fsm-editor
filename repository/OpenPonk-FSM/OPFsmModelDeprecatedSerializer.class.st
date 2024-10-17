Class {
	#name : 'OPFsmModelDeprecatedSerializer',
	#superclass : 'OPFsmModelSerializer',
	#category : 'OpenPonk-FSM-Serialization',
	#package : 'OpenPonk-FSM',
	#tag : 'Serialization'
}

{ #category : 'as yet unclassified' }
OPFsmModelDeprecatedSerializer class >> fileExtensions [

	^ #( #ston )
]

{ #category : 'as yet unclassified' }
OPFsmModelDeprecatedSerializer class >> formatName [

	^ #'graphml-ston'
]
