"
Verifies GraphML export, import, transition matching roundtrip, template structure, and boundary error handling for finite-state machine models.
"
Class {
	#name : 'OPFsmGraphMLTest',
	#superclass : 'TestCase',
	#instVars : [
		'graphML'
	],
	#category : 'OpenPonk-FSM-Tests-Serialization',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Serialization'
}

{ #category : 'running' }
OPFsmGraphMLTest >> setUp [

	super setUp.
	graphML := OPFsmGraphML new
]

{ #category : 'running' }
OPFsmGraphMLTest >> tearDown [

	graphML := nil.
	super tearDown
]

{ #category : 'tests' }
OPFsmGraphMLTest >> testExportAndImportEmptyModelAndSpecialXmlCharacters [

	| emptyModel importedEmpty specialModel initialState regularState finalState transitionComma transitionCustom importedSpecial importedStatesByUuid importedTransitionComma importedTransitionCustom |
	emptyModel := OPFsmExamples emptyModel.
	importedEmpty := graphML import: (graphML export: emptyModel).
	self assert: importedEmpty uuid equals: emptyModel uuid.
	self assert: importedEmpty name equals: 'New StateMachine Diagram'.
	self assertEmpty: importedEmpty states.
	self assertEmpty: importedEmpty transitions.

	specialModel := OPFsm named: 'FSM & <Special> "Quotes" ''Single'''.
	initialState := OPFsmInitialState named: ''.
	regularState := OPFsmState named: 'A & B < C'.
	finalState := (OPFsmState named: 'Done "''>')
		              beFinal;
		              yourself.
	transitionComma := (initialState => regularState)
		                   name: 'a,b & <1>';
		                   yourself.
	transitionCustom := (regularState => finalState)
		                    name: 'lt';
		                    matchBlock: [ :value | value < 'z' and: [ value ~= '''' ] ];
		                    yourself.
	specialModel addAll: {
			initialState.
			regularState.
			finalState.
			transitionComma.
			transitionCustom }.

	importedSpecial := graphML import: (graphML export: specialModel).
	self assert: importedSpecial uuid equals: specialModel uuid.
	self assert: importedSpecial name equals: 'FSM & <Special> "Quotes" ''Single'''.
	self assert: importedSpecial states size equals: 3.
	self assert: importedSpecial transitions size equals: 2.

	importedStatesByUuid := (importedSpecial states collect: [ :each | each uuid -> each ]) asDictionary.
	self assert: (importedStatesByUuid at: initialState uuid) class identicalTo: OPFsmInitialState.
	self assert: (importedStatesByUuid at: initialState uuid) name equals: ''.
	self assert: (importedStatesByUuid at: regularState uuid) name equals: 'A & B < C'.
	self
		assert: (importedStatesByUuid at: regularState uuid) isNormal
		description: 'Regular state must remain normal after GraphML import'.
	self assert: (importedStatesByUuid at: finalState uuid) name equals: 'Done "''>'.
	self assert: (importedStatesByUuid at: finalState uuid) isFinal description: 'Final state must remain final after GraphML import'.

	importedTransitionComma := importedSpecial transitions detect: [ :each | each uuid = transitionComma uuid ].
	self assert: importedTransitionComma name equals: 'a,b & <1>'.
	self assert: importedTransitionComma source identicalTo: (importedStatesByUuid at: initialState uuid).
	self assert: importedTransitionComma target identicalTo: (importedStatesByUuid at: regularState uuid).
	self
		assert: (importedTransitionComma matches: 'a')
		description: 'Comma-separated transition must match first branch after import'.
	self
		assert: (importedTransitionComma matches: 'b & <1>')
		description: 'Comma-separated transition must match second branch with XML characters after import'.

	importedTransitionCustom := importedSpecial transitions detect: [ :each | each uuid = transitionCustom uuid ].
	self
		assert: (importedTransitionCustom matches: 'm')
		description: 'Custom block with < and quote literals must match after import'.
	self
		deny: (importedTransitionCustom matches: '''')
		description: 'Custom block with quote literal must reject single quote after import'
]

{ #category : 'tests' }
OPFsmGraphMLTest >> testExportAndImportRoundtripWithDefaultAndCustomMatchBlocks [

	| originalDivisibility importedDivisibility importedOneTransition recognizer events originalDecimal importedDecimal importedDigitTransition importedPlusTransition |
	originalDivisibility := OPFsmExamples exampleDivisibility.
	importedDivisibility := graphML import: (graphML export: originalDivisibility).
	self assert: importedDivisibility class identicalTo: OPFsm.
	self assert: importedDivisibility uuid equals: originalDivisibility uuid.
	self assert: importedDivisibility name equals: originalDivisibility name.
	self assert: importedDivisibility states size equals: 4.
	self assert: importedDivisibility transitions size equals: 7.
	self assert: (importedDivisibility states count: #isInitial) equals: 1.
	self assert: (importedDivisibility states count: #isFinal) equals: 1.
	self assert: (importedDivisibility states count: #isNormal) equals: 2.

	importedOneTransition := importedDivisibility transitions detect: [ :each | each name = '1' ].
	self assert: (importedOneTransition matches: '1') description: 'Imported default transition must match its own label'.
	self deny: (importedOneTransition matches: '0') description: 'Imported default transition must reject non-matching input'.

	recognizer := OPFsmRecognizer new.
	events := OrderedCollection new.
	recognizer when: OPFsmRecognizerEvent do: [ :event | events add: event ] for: self.
	[
		recognizer input: '11' startingAt: (importedDivisibility states detect: #isInitial).
		5 timesRepeat: [ recognizer next ].
		self assert: events last class identicalTo: OPFsmRecognizerSuccess.

		events removeAll.
		recognizer input: '10' startingAt: (importedDivisibility states detect: #isInitial).
		5 timesRepeat: [ recognizer next ].
		self assert: events last class identicalTo: OPFsmRecognizerFailure ] ensure: [ recognizer unsubscribe: self ].

	originalDecimal := OPFsmExamples exampleDecimal.
	importedDecimal := graphML import: (graphML export: originalDecimal).
	self assert: importedDecimal states size equals: 6.
	self assert: importedDecimal transitions size equals: 11.
	importedDigitTransition := importedDecimal transitions detect: [ :each | each name = 'd' ].
	importedPlusTransition := importedDecimal transitions detect: [ :each | each name = '+' ].
	self assert: (importedDigitTransition matches: '7') description: 'Imported custom regex transition must match digits'.
	self
		deny: (importedDigitTransition matches: 'd')
		description: 'Imported custom regex transition must preserve custom matchBlock over name'.
	self assert: (importedPlusTransition matches: '+') description: 'Imported default decimal transition must match +'.
	self deny: (importedPlusTransition matches: '-') description: 'Imported default decimal transition must reject -'
]

{ #category : 'tests' }
OPFsmGraphMLTest >> testImportErrorBoundaryCases [

	| missingNameXml missingNodeTypeXml danglingEdgeXml |
	self should: [ graphML import: '<graphml><broken' ] raise: XMLWellFormednessException.

	missingNameXml := String streamContents: [ :stream |
			                  stream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'.
			                  stream nextPutAll: '<graphml xmlns="http://graphml.graphdrawing.org/xmlns">'.
			                  stream nextPutAll: '<graph id="'.
			                  stream nextPutAll: UUID new asString.
			                  stream nextPutAll: '" edgedefault="directed"></graph></graphml>' ].
	self should: [ graphML import: missingNameXml ] raise: KeyNotFound.

	missingNodeTypeXml := String streamContents: [ :stream |
			                      stream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'.
			                      stream nextPutAll: '<graphml xmlns="http://graphml.graphdrawing.org/xmlns">'.
			                      stream nextPutAll: '<graph id="'.
			                      stream nextPutAll: UUID new asString.
			                      stream nextPutAll: '" edgedefault="directed"><data key="name">FSM</data>'.
			                      stream nextPutAll: '<node id="'.
			                      stream nextPutAll: UUID new asString.
			                      stream nextPutAll: '"><data key="name">S1</data></node></graph></graphml>' ].
	self should: [ graphML import: missingNodeTypeXml ] raise: KeyNotFound.

	danglingEdgeXml := String streamContents: [ :stream |
			                   stream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'.
			                   stream nextPutAll: '<graphml xmlns="http://graphml.graphdrawing.org/xmlns">'.
			                   stream nextPutAll: '<graph id="'.
			                   stream nextPutAll: UUID new asString.
			                   stream nextPutAll: '" edgedefault="directed"><data key="name">Broken</data>'.
			                   stream nextPutAll: '<edge id="'.
			                   stream nextPutAll: UUID new asString.
			                   stream nextPutAll: '" source="'.
			                   stream nextPutAll: UUID new asString.
			                   stream nextPutAll: '" target="'.
			                   stream nextPutAll: UUID new asString.
			                   stream nextPutAll:
				                   '"><data key="name">a</data><data key="matchBlock">[ :v | true ]</data></edge></graph></graphml>' ].
	self should: [ graphML import: danglingEdgeXml ] raise: KeyNotFound
]

{ #category : 'tests' }
OPFsmGraphMLTest >> testNodeForTypeAndTemplate [

	| initialNode finalNode regularNode fallbackNode templateDocument |
	initialNode := graphML nodeForType: #initial.
	finalNode := graphML nodeForType: #final.
	regularNode := graphML nodeForType: #regular.
	fallbackNode := graphML nodeForType: #unknown.

	self assert: initialNode class identicalTo: OPFsmInitialState.
	self assert: finalNode class identicalTo: OPFsmState.
	self assert: finalNode isFinal description: 'Final node type must return a final state'.
	self assert: regularNode class identicalTo: OPFsmState.
	self assert: regularNode isNormal description: 'Regular node type must return a normal state'.
	self assert: fallbackNode class identicalTo: OPFsmState.
	self assert: fallbackNode isNormal description: 'Unknown node type must fall back to a normal state'.

	templateDocument := XMLDOMParser parse: graphML template.
	self assert: templateDocument root name equals: 'graphml'
]
