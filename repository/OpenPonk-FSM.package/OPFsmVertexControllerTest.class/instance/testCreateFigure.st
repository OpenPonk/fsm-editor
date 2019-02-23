tests
testCreateFigure
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller renderFigureIn: diagramController view.
	self assert: diagramController view elements size equals: 1.
	self assert: controller figure class equals: OPFsmInitialStateFigure