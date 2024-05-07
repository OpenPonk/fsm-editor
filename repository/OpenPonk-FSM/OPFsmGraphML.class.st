Class {
	#name : 'OPFsmGraphML',
	#superclass : 'Object',
	#category : 'OpenPonk-FSM-Serialization',
	#package : 'OpenPonk-FSM',
	#tag : 'Serialization'
}

{ #category : 'export' }
OPFsmGraphML >> export: aModel [
	^ (MustacheTemplate on: self template)
		value:
			{(#dateTime -> DateAndTime now truncated).
			(#model -> aModel).
			(#states
				->
					(aModel states
						collect: [ :each | 
							Dictionary
								with: #uuid -> each uuid
								with: #name -> each name
								with: #graphmlType -> each graphmlType ]))} asDictionary
]

{ #category : 'import' }
OPFsmGraphML >> import: aXml [
	| model doc graph graphData node nodeData edge edgeData nodes |
	doc := XMLDOMParser parse: aXml.
	graph := (doc root / #graph) first.
	graphData := (graph / #data
		collect: [ :each | (each attributeAt: #key) -> each stringValue ])
		asDictionary.
	model := OPFsm new.
	model uuid: (UUID fromString: (graph attributeAt: #id)).
	model name: (graphData at: #name).
	nodes := Dictionary new.
	graph / #node
		do: [ :each | 
			nodeData := (each / #data
				collect: [ :data | (data attributeAt: #key) -> data stringValue ])
				asDictionary.
			node := self nodeForType: (nodeData at: #'node-type').
			node uuid: (UUID fromString: (each attributeAt: #id)).
			node name: (nodeData at: #name).
			nodes at: node uuid put: node.
			model add: node ].
	graph / #edge
		do: [ :each | 
			edgeData := (each / #data
				collect: [ :data | (data attributeAt: #key) -> data stringValue ])
				asDictionary.
			(edge := OPFsmTransition new)
				uuid: (UUID fromString: (each attributeAt: #id));
				name: (edgeData at: #name);
				source: (nodes at: (UUID fromString: (each attributeAt: #source)));
				target: (nodes at: (UUID fromString: (each attributeAt: #target)));
				matchBlock:
					(OpalCompiler new
						source: (edgeData at: #matchBlock);
						evaluate).
			model add: edge ].
	^ model
]

{ #category : 'import' }
OPFsmGraphML >> nodeForType: aType [
	aType = #initial
		ifTrue: [ ^ OPFsmInitialState new ].
	aType = #final
		ifTrue: [ ^ OPFsmState new
				beFinal;
				yourself ].
	^ OPFsmState new
]

{ #category : 'export' }
OPFsmGraphML >> template [
	<script: '(XMLDOMParser parse: self new template) inspect'>
	^ '<?xml version="1.0" encoding="UTF-8"?>
<graphml
	xmlns="http://graphml.graphdrawing.org/xmlns"  
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://graphml.graphdrawing.org/xmlns
	http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd">

	<key id="name" attr.name="element name" attr.type="string" for="all" />
	<key id="generated" attr.name="generation datetime" attr.type="string" for="graph" />
	<key id="node-type" attr.name="node type" attr.type="string" for="node" />
	<key id="matchBlock" attr.name="Pharo BlockClosure code" attr.type="string"  for="edge" />

	<graph id="{{model.uuid}}" edgedefault="directed">
		<data key="name">{{model.name}}</data>
		<data key="generated">{{dateTime}}</data>
		{{# states }}
		<node id="{{uuid}}">
			<data key="name">{{name}}</data>
			<data key="node-type">{{graphmlType}}</data>
		</node>
		{{/ states }}
		{{# model.transitions }}
		<edge id="{{uuid}}" source="{{source.uuid}}" target="{{target.uuid}}">
			<data key="name">{{name}}</data>
			<data key="matchBlock">{{matchBlock.asString}}</data>
		</edge>
		{{/ model.transitions }}
	</graph>
</graphml>'
]
