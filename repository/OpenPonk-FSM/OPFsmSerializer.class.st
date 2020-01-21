Class {
	#name : #OPFsmSerializer,
	#superclass : #OPAbstractSerializer,
	#category : 'OpenPonk-FSM-Serialization'
}

{ #category : #accessing }
OPFsmSerializer >> diagramExtension [
	^ 'ston'
]

{ #category : #'serialize/materialize' }
OPFsmSerializer >> materializeDiagramFrom: aString [
	^ (STON reader
		allowComplexMapKeys: true;
		on: aString readStream) next
]

{ #category : #'serialize/materialize' }
OPFsmSerializer >> materializeModelFrom: aString [
	^ OPFsmGraphML new import: aString
]

{ #category : #accessing }
OPFsmSerializer >> modelExtension [
	^ 'graphml'
]

{ #category : #'serialize/materialize' }
OPFsmSerializer >> serializeDiagram: aDiagramMemento [
	^ STON toStringPretty: aDiagramMemento
]

{ #category : #'serialize/materialize' }
OPFsmSerializer >> serializeModel: aModel [
	^ OPFsmGraphML new export: aModel
]
