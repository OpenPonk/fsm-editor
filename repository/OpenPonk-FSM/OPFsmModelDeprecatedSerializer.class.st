Class {
	#name : 'OPFsmModelDeprecatedSerializer',
	#superclass : 'OPFsmModelSerializer',
	#category : 'OpenPonk-FSM-Serialization',
	#package : 'OpenPonk-FSM',
	#tag : 'Serialization'
}

{ #category : 'as yet unclassified' }
OPFsmModelDeprecatedSerializer class >> fileExtension [

	^ #ston
]

{ #category : 'as yet unclassified' }
OPFsmModelDeprecatedSerializer class >> formatName [

	^ #'graphml-ston'
]
