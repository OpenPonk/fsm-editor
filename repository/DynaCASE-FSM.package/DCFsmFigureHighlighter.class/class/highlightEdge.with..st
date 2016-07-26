api - highlight
highlightEdge: anEdge with: aColor
	self unhighlightElement: anEdge.
	anEdge attributeAt: self name put: (anEdge shape colorFor: anEdge).
	anEdge shape color: aColor.
	anEdge update.
	anEdge signalUpdate