tests
testCreateFigure
	| figure |
	controller
		source: fromCtrl;
		target: toCtrl;
		model: model.
	diagramController addController: controller.
	figure := controller renderFigureIn: diagramController view.
	self assert: figure class equals: RTEdge.
	self assert: figure from equals: fromCtrl figure.
	self assert: figure to equals: toCtrl figure.
	self assert: diagramController view elements size equals: 5.
	self assert: figure shape class equals: OPRTStyledMultiLine.
	self assert: figure shape color equals: Color black.
	self assert: figure shape head shape equals: RTSimpleArrow.
	self assert: figure shape dashes isNil