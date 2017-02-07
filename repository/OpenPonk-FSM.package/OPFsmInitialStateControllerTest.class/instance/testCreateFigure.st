tests
testCreateFigure
	super testCreateFigure.
	self assert: figure shape class equals: RTEllipse.
	self assert: figure color equals: Color black.
	self assert: figure extent equals: 14 @ 14