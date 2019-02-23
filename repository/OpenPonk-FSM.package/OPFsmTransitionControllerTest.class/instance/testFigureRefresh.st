tests
testFigureRefresh
	| label |
	controller
		source: fromCtrl;
		target: toCtrl.
	diagramController addController: controller.
	controller createModelIn: diagramController model.
	controller renderFigureIn: diagramController view.
	label := controller figure labels at: #name.
	self assert: label trachelShape text equals: ''.
	controller model name: 'new name'.
	controller refreshFigure.
	self assert: label trachelShape text equals: 'new name'