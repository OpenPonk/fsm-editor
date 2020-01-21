Class {
	#name : #DCFsmGraphML,
	#superclass : #Object,
	#category : 'DynaCASE-FSM-GraphML'
}

{ #category : #export }
DCFsmGraphML >> export: aModel [
	^ self export: aModel withLayout: Dictionary new
]

{ #category : #export }
DCFsmGraphML >> export: aModel withLayout: aLayout [
	^ (MustacheTemplate on: (self template copyReplaceAll: String cr with: String lf))
		value:
			{(#dateTime -> DateAndTime now truncated).
			(#model -> aModel).
			(#states
				->
					(aModel states
						collect: [ :each | 
							{(#uuid -> each uuid).
							(#name -> each name).
							(#graphmlType -> each graphmlType).
							(#position -> (aLayout at: each uuid ifAbsent: [ 0 @ 0 ]))} asDictionary ]))}
				asDictionary
]

{ #category : #import }
DCFsmGraphML >> import: aXml [
	| model doc graph layout graphData node nodeData edge edgeData nodes |
	layout := Dictionary new.
	doc := XMLDOMParser parse: aXml.
	graph := (doc root / #graph) first.
	graphData := (graph / #data
		collect: [ :each | (each attributeAt: #key) -> each stringValue ]) asDictionary.
	model := DCFsm new.
	model uuid: (UUID fromString: (graph attributeAt: #id)).
	model name: (graphData at: #name).
	nodes := Dictionary new.
	graph / #node
		do: [ :each | 
			nodeData := (each / #data
				collect: [ :data | (data attributeAt: #key) -> data stringValue ]) asDictionary.
			node := self nodeForType: (nodeData at: #'node-type').
			node uuid: (UUID fromString: (each attributeAt: #id)).
			node name: (nodeData at: #name).
			nodes at: node uuid put: node.
			layout at: node uuid put: (nodeData at: #x) asNumber @ (nodeData at: #y) asNumber.
			model add: node ].
	graph / #edge
		do: [ :each | 
			edgeData := (each / #data
				collect: [ :data | (data attributeAt: #key) -> data stringValue ]) asDictionary.
			(edge := DCFsmTransition new)
				uuid: (UUID fromString: (each attributeAt: #id));
				name: (edgeData at: #name);
				source: (nodes at: (UUID fromString: (each attributeAt: #source)));
				target: (nodes at: (UUID fromString: (each attributeAt: #target)));
				matchBlock: (OpalCompiler evaluate: (edgeData at: #matchBlock)).
			model add: edge ].
	^ {(#model -> model).
	(#layout -> layout)} asDictionary
]

{ #category : #import }
DCFsmGraphML >> nodeForType: aType [
	aType = #initial
		ifTrue: [ ^ DCFsmInitialState new ].
	aType = #final
		ifTrue: [ ^ DCFsmState new
				beFinal;
				yourself ].
	^ DCFsmState new
]

{ #category : #export }
DCFsmGraphML >> template [
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
	<key id="x" attr.name="x" attr.type="double" for="node" />
	<key id="y" attr.name="y" attr.type="double" for="node" />
	<key id="matchBlock" attr.name="Pharo BlockClosure code" attr.type="string"  for="edge" />

	<graph id="{{model.uuid}}" edgedefault="directed">
		<data key="name">{{model.name}}</data>
		<data key="generated">{{dateTime}}</data>
		{{# states }}
		<node id="{{uuid}}">
			<data key="name">{{name}}</data>
			<data key="node-type">{{graphmlType}}</data>
			<data key="x">{{position.x}}</data>
			<data key="y">{{position.y}}</data>
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
