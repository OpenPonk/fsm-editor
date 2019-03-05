tests
testCreateFigure
	super testCreateFigure.
	self assert: controller figure shape class equals: RTEllipse.
	self assert: controller figure color equals: Color black.
	self assert: controller figure extent equals: 14 @ 14