Class {
	#name : 'OPFsmModelSerializer',
	#superclass : 'OPModelSerializer',
	#category : 'OpenPonk-FSM-Serialization',
	#package : 'OpenPonk-FSM',
	#tag : 'Serialization'
}

{ #category : 'as yet unclassified' }
OPFsmModelSerializer class >> exportVersion [

	^ 1
]

{ #category : 'as yet unclassified' }
OPFsmModelSerializer class >> fileExtension [

	^ #xml
]

{ #category : 'as yet unclassified' }
OPFsmModelSerializer class >> formatName [

	^ #graphml
]

{ #category : 'accessing' }
OPFsmModelSerializer class >> minImportVersion [

	^ 1
]

{ #category : 'serialize/materialize' }
OPFsmModelSerializer >> materializeModelFrom: aStream [
	^ self materializeModelFromString: aStream contents
]

{ #category : 'serialize/materialize' }
OPFsmModelSerializer >> materializeModelFromString: aString [
	^ OPFsmGraphML new import: aString
]

{ #category : 'serialize/materialize' }
OPFsmModelSerializer >> serializeModel: aModel [
	^ OPFsmGraphML new export: aModel
]

{ #category : 'serialize/materialize' }
OPFsmModelSerializer >> serializeModel: aModel to: aStream [
	^ aStream << (self serializeModel: aModel)
]
