tests
testFigureRefresh
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller renderFigureIn: diagramController view.
	self assert: controller figure model name equals: ''.
	controller model name: 'new name'.
	controller refreshFigure.
	self assert: controller figure ownedElements first trachelShape text equals: 'new name'