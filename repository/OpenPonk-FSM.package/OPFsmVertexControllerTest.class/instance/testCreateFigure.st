tests
testCreateFigure
	self class = OPFsmVertexControllerTest
		ifTrue: [ ^ self ].
	self renderFigure.
	self assert: view elements size equals: 1.
	self assert: figure class equals: OPFsmInitialStateFigure