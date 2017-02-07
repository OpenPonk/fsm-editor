import
import: aXml
	| model doc graph graphData node nodeData edge edgeData nodes |
	doc := XMLDOMParser parse: aXml.
	graph := (doc root / #graph) first.
	graphData := (graph / #data
		collect: [ :each | (each attributeAt: #key) -> each stringValue ]) asDictionary.
	model := OPFsm new.
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
			model add: node ].
	graph / #edge
		do: [ :each | 
			edgeData := (each / #data
				collect: [ :data | (data attributeAt: #key) -> data stringValue ]) asDictionary.
			(edge := OPFsmTransition new)
				uuid: (UUID fromString: (each attributeAt: #id));
				name: (edgeData at: #name);
				source: (nodes at: (UUID fromString: (each attributeAt: #source)));
				target: (nodes at: (UUID fromString: (each attributeAt: #target)));
				matchBlock: (OpalCompiler evaluate: (edgeData at: #matchBlock)).
			model add: edge ].
	^ model