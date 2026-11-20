"
Verifies highlight and unhighlight operations on finite-state machine node and edge Roassal shapes, including repeated highlights and property cleanup.
"
Class {
	#name : 'OPFsmFigureHighlighterTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-FSM-Tests-DiagramElements',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'DiagramElements'
}

{ #category : 'tests' }
OPFsmFigureHighlighterTest >> testHighlightAndUnhighlightLineAndBezierShapes [

	| polyline bezier |
	polyline := OPRSPolyline new
		            color: Color blue;
		            yourself.
	bezier := OPRSBezier new
		          color: Color blue;
		          yourself.

	{
		polyline.
		bezier } do: [ :eachLine |
			OPFsmFigureHighlighter unhighlight: eachLine.
			self assert: eachLine color equals: Color blue.
			self
				deny: (eachLine hasProperty: #OPFsmFigureHighlighter)
				description: 'Unhighlighting an unhighlighted line must leave no property'.

			OPFsmFigureHighlighter highlight: eachLine with: Color orange.
			self assert: eachLine color equals: Color orange.
			self assert: (eachLine hasProperty: #OPFsmFigureHighlighter) description: 'Highlighted line must store original color property'.

			OPFsmFigureHighlighter highlight: eachLine with: Color red.
			self assert: eachLine color equals: Color red.

			OPFsmFigureHighlighter unhighlight: eachLine.
			self assert: eachLine color equals: Color blue.
			self
				deny: (eachLine hasProperty: #OPFsmFigureHighlighter)
				description: 'Unhighlighting a line must remove highlighter property' ]
]

{ #category : 'tests' }
OPFsmFigureHighlighterTest >> testHighlightAndUnhighlightNodeShape [

	| stateShape circle |
	stateShape := OPFsmStateShape new.
	circle := stateShape renderBasicShape.
	self assert: circle borderColor equals: Color black.

	OPFsmFigureHighlighter unhighlight: circle.
	self assert: circle borderColor equals: Color black.
	self
		deny: (circle hasProperty: #OPFsmFigureHighlighter)
		description: 'Unhighlighting an unhighlighted node must leave no highlighter property'.

	OPFsmFigureHighlighter highlight: circle with: Color orange.
	self assert: circle borderColor equals: Color orange.
	self
		assert: (circle hasProperty: #OPFsmFigureHighlighter)
		description: 'Highlighted node must store original border color property'.

	OPFsmFigureHighlighter highlight: circle with: Color green.
	self assert: circle borderColor equals: Color green.

	OPFsmFigureHighlighter unhighlight: circle.
	self assert: circle borderColor equals: Color black.
	self deny: (circle hasProperty: #OPFsmFigureHighlighter) description: 'Unhighlighting a node must remove highlighter property'
]
