Class {
	#name : #OPFsmModelSerializer,
	#superclass : #OPModelSerializer,
	#category : #'OpenPonk-FSM-Serialization'
}

{ #category : #'as yet unclassified' }
OPFsmModelSerializer class >> exportVersion [

	^ 1
]

{ #category : #formatting }
OPFsmModelSerializer class >> formatName [

	^ #ston
]

{ #category : #accessing }
OPFsmModelSerializer class >> minImportVersion [

	^ 1
]

{ #category : #accessing }
OPFsmModelSerializer >> formatName [
	^ 'ston'
]

{ #category : #'serialize/materialize' }
OPFsmModelSerializer >> materializeDiagramFrom: aString [
	^ STON fromString: aString
]

{ #category : #'serialize/materialize' }
OPFsmModelSerializer >> materializeModelFrom: aStream [
	^ self materializeModelFromString: aStream contents
]

{ #category : #'serialize/materialize' }
OPFsmModelSerializer >> materializeModelFromString: aString [
	^ OPFsmGraphML new import: aString
]

{ #category : #accessing }
OPFsmModelSerializer >> modelExtension [
	^ 'graphml'
]

{ #category : #'serialize/materialize' }
OPFsmModelSerializer >> serializeDiagram: aDiagramMemento [
	^ STON toStringPretty: aDiagramMemento
]

{ #category : #'serialize/materialize' }
OPFsmModelSerializer >> serializeModel: aModel [
	^ OPFsmGraphML new export: aModel
]

{ #category : #accessing }
OPFsmModelSerializer >> serializeModel: aModel to: aStream [
	^ aStream << (self serializeModel: aModel)
]
