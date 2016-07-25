userinterface
applyLayout: anAlgorithm
	| figures edges |
	figures := self controllers
		select: [ :each | each isKindOf: DCFsmVertexController ]
		thenCollect: #figure.
	edges := (figures flatCollect: #connectedEdges) reject: [ :each | each from = each to ].
	anAlgorithm on: figures edges: edges.
	self view canvas camera focusOnCenter