api - highlight
highlight: aShapedObject with: aColor
	aShapedObject isElement
		ifTrue: [ self highlightElement: aShapedObject with: aColor ].
	aShapedObject isEdge
		ifTrue: [ self highlightEdge: aShapedObject with: aColor ]