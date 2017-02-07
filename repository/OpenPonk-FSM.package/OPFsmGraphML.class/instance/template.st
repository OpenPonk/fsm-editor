export
template
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