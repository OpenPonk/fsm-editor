Class {
	#name : #OPFsmModelSerializer,
	#superclass : #OPModelSerializer,
	#category : #'OpenPonk-FSM-Serialization'
}

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
