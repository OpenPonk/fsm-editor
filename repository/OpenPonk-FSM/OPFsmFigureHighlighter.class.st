"
I highlight or unhlight FSM figures (both elements and edges).

!! Responsiblity

Hightlight and unhighlight fsm figures.

!! Collaborators

FSM Figures.
"
Class {
	#name : #OPFsmFigureHighlighter,
	#superclass : #Object,
	#category : 'OpenPonk-FSM-Figures'
}

{ #category : #'api - highlight' }
OPFsmFigureHighlighter class >> highlight: aShapedObject with: aColor [
	aShapedObject isElement
		ifTrue: [ self highlightElement: aShapedObject with: aColor ].
	aShapedObject isEdge
		ifTrue: [ self highlightEdge: aShapedObject with: aColor ]
]

{ #category : #'api - highlight' }
OPFsmFigureHighlighter class >> highlightEdge: anEdge with: aColor [
	self unhighlightElement: anEdge.
	anEdge attributeAt: self name put: (anEdge shape colorFor: anEdge).
	anEdge shape color: aColor.
	anEdge update.
	anEdge signalUpdate
]

{ #category : #'api - highlight' }
OPFsmFigureHighlighter class >> highlightElement: anElement with: aColor [
	self unhighlightElement: anElement.
	anElement attributeAt: self name put: (anElement shape borderColorFor: anElement).
	anElement shape borderColor: aColor.
	anElement update.
	anElement signalUpdate
]

{ #category : #'api - unhighlight' }
OPFsmFigureHighlighter class >> unhighlight: aShapedObject [
	aShapedObject isElement
		ifTrue: [ self unhighlightElement: aShapedObject ].
	aShapedObject isEdge
		ifTrue: [ self unhighlightEdge: aShapedObject ]
]

{ #category : #'api - unhighlight' }
OPFsmFigureHighlighter class >> unhighlightEdge: anEdge [
	(anEdge hasAttribute: self name)
		ifFalse: [ ^ self ].
	anEdge shape color: (anEdge attributeAt: self name).
	anEdge removeAttributeAt: self name.
	anEdge update.
	anEdge signalUpdate
]

{ #category : #'api - unhighlight' }
OPFsmFigureHighlighter class >> unhighlightElement: anElement [
	(anElement hasAttribute: self name)
		ifFalse: [ ^ self ].
	anElement shape borderColor: (anElement attributeAt: self name).
	anElement removeAttributeAt: self name.
	anElement update.
	anElement signalUpdate
]
