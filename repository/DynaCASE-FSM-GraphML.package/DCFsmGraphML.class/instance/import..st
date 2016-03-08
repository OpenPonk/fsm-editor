import
import: aXml
	| model doc graph layout graphData node nodeData edge edgeData nodes |
	layout := Dictionary new.
	doc := XMLDOMParser parse: aXml.
	graph := (doc root / #graph) first.
	graphData := (graph / #data
		collect: [ :each | (each attributeAt: #key) -> each stringValue ]) asDictionary.
	model := DCFsm new.
	model dcID: (UUID fromString: (graph attributeAt: #id)).
	model name: (graphData at: #name).
	nodes := Dictionary new.
	graph / #node
		do: [ :each | 
			nodeData := (each / #data
				collect: [ :data | (data attributeAt: #key) -> data stringValue ]) asDictionary.
			node := self nodeForType: (nodeData at: #'node-type').
			node dcID: (UUID fromString: (each attributeAt: #id)).
			node name: (nodeData at: #name).
			nodes at: node dcID put: node.
			layout at: node dcID put: (nodeData at: #x) asNumber @ (nodeData at: #y) asNumber.
			model add: node ].
	graph / #edge
		do: [ :each | 
			edgeData := (each / #data
				collect: [ :data | (data attributeAt: #key) -> data stringValue ]) asDictionary.
			(edge := DCFsmTransition new)
				dcID: (UUID fromString: (each attributeAt: #id));
				name: (edgeData at: #name);
				source: (nodes at: (UUID fromString: (each attributeAt: #source)));
				target: (nodes at: (UUID fromString: (each attributeAt: #target)));
				matchBlock: (OpalCompiler evaluate: (edgeData at: #matchBlock)).
			model add: edge ].
	^ {(#model -> model).
	(#layout -> layout)} asDictionary