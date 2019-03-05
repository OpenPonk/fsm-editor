tests
testCreateFigure
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller renderFigureIn: diagramController view.
	self assert: diagramController view elements size equals: 2.
	self assert: controller figure class equals: OPFsmStateFigure.
	self assert: controller figure shape class equals: RTRoundedBox.
	self assert: controller figure color equals: Color white.
	self assert: controller figure extent equals: 50 @ 50