tests
testCreateFigure
	self renderFigure.
	self assert: view elements size equals: 2.
	self assert: figure class equals: DCFsmStateFigure.
	self assert: figure shape class equals: RTRoundedBox.
	self assert: figure color equals: Color white.
	self assert: figure extent equals: 50 @ 50