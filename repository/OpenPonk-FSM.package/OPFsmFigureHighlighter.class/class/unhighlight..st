api - unhighlight
unhighlight: aShapedObject
	aShapedObject isElement
		ifTrue: [ self unhighlightElement: aShapedObject ].
	aShapedObject isEdge
		ifTrue: [ self unhighlightEdge: aShapedObject ]