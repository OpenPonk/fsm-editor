"
Verifies GraphML model serializer metadata, stream serialization, materialization, and deprecated serializer identifiers for finite-state machine models.
"
Class {
	#name : 'OPFsmModelSerializerTest',
	#superclass : 'OPModelSerializerTest',
	#category : 'OpenPonk-FSM-Tests-Serialization',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Serialization'
}

{ #category : 'accessing' }
OPFsmModelSerializerTest >> newModel [

	^ OPFsmExamples exampleDivisibility
]

{ #category : 'accessing' }
OPFsmModelSerializerTest >> serializerClass [

	^ OPFsmModelSerializer
]

{ #category : 'running' }
OPFsmModelSerializerTest >> tearDown [

	model := nil.
	serializer := nil.
	stream := nil.
	super tearDown
]

{ #category : 'tests' }
OPFsmModelSerializerTest >> testMetadataAndFormatIdentifiers [

	| matchingInfo mismatchedFormatInfo mismatchedVersionInfo deprecatedInfo |
	self assert: OPFsmModelSerializer formatName equals: #graphml.
	self assert: OPFsmModelSerializer exportVersion equals: 1.
	self assert: OPFsmModelSerializer minImportVersion equals: 1.
	self assert: OPFsmModelSerializer exportSubject equals: #model.
	self assertCollection: OPFsmModelSerializer fileExtensions hasSameElements: #( #xml ).

	matchingInfo := OPFsmModelSerializer exportInfo.
	self
		assert: (OPFsmModelSerializer supportsExportInfo: matchingInfo)
		description: 'Serializer must support its own export metadata'.

	mismatchedFormatInfo := OPExportInfo new
		                        subject: #model;
		                        format: #ston;
		                        version: 1;
		                        yourself.
	self
		deny: (OPFsmModelSerializer supportsExportInfo: mismatchedFormatInfo)
		description: 'Serializer must reject a different format name'.

	mismatchedVersionInfo := OPExportInfo new
		                         subject: #model;
		                         format: #graphml;
		                         version: 2;
		                         yourself.
	self
		deny: (OPFsmModelSerializer supportsExportInfo: mismatchedVersionInfo)
		description: 'Serializer must reject an unsupported version'.

	self assert: serializer formatName equals: #graphml.
	self assert: serializer fileExtension equals: #xml.
	self assert: OPFsmModelDeprecatedSerializer formatName equals: #'graphml-ston'.
	self assertCollection: OPFsmModelDeprecatedSerializer fileExtensions hasSameElements: #( #ston ).

	deprecatedInfo := OPExportInfo new
		                  subject: #model;
		                  format: #'graphml-ston';
		                  version: 1;
		                  yourself.
	self
		assert: (OPFsmModelDeprecatedSerializer supportsExportInfo: deprecatedInfo)
		description: 'Deprecated serializer must support graphml-ston export metadata'
]

{ #category : 'tests' }
OPFsmModelSerializerTest >> testRoundtrip [

	| materializedModel |
	serializer serializeModel: model to: stream.
	self assert: (stream contents includesSubstring: '<graphml') description: 'Serialized stream must contain GraphML XML'.

	materializedModel := serializer materializeModelFrom: (ReadStream on: stream contents).
	self deny: materializedModel identicalTo: model.
	self assert: materializedModel class identicalTo: OPFsm.
	self assert: materializedModel uuid equals: model uuid.
	self assert: materializedModel name equals: model name.
	self
		assertCollection: (materializedModel states collect: [ :eachState | eachState uuid -> eachState name ])
		hasSameElements: (model states collect: [ :eachState | eachState uuid -> eachState name ]).
	self
		assertCollection: (materializedModel transitions collect: [ :eachTransition |
					 eachTransition uuid -> {
						 eachTransition name.
						 eachTransition source uuid.
						 eachTransition target uuid } ])
		hasSameElements: (model transitions collect: [ :eachTransition |
					 eachTransition uuid -> {
						 eachTransition name.
						 eachTransition source uuid.
						 eachTransition target uuid } ])
]

{ #category : 'tests' }
OPFsmModelSerializerTest >> testSerializeAndMaterializeModelStringAndEmptyModel [

	| emptyModel emptyXml restoredEmpty divisibilityXml restoredDivisibility |
	emptyModel := OPFsmExamples emptyModel.
	emptyXml := serializer serializeModel: emptyModel.
	restoredEmpty := serializer materializeModelFromString: emptyXml.
	self deny: restoredEmpty identicalTo: emptyModel.
	self assert: restoredEmpty class identicalTo: OPFsm.
	self assert: restoredEmpty uuid equals: emptyModel uuid.
	self assert: restoredEmpty name equals: 'New StateMachine Diagram'.
	self assertEmpty: restoredEmpty states.
	self assertEmpty: restoredEmpty transitions.

	divisibilityXml := serializer serializeModel: model.
	restoredDivisibility := serializer materializeModelFromString: divisibilityXml.
	self deny: restoredDivisibility identicalTo: model.
	self assert: restoredDivisibility uuid equals: model uuid.
	self assert: restoredDivisibility states size equals: 4.
	self assert: restoredDivisibility transitions size equals: 7
]
