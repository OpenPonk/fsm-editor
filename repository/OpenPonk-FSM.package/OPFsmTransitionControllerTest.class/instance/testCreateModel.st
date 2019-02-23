tests
testCreateModel
	| createdModel |
	fromCtrl model: fromCtrl createModel.
	toCtrl model: toCtrl createModel.
	controller source: fromCtrl.
	controller target: toCtrl.
	createdModel := controller createModel.
	self assert: model class equals: OPFsmTransition.
	self assert: model source equals: fromCtrl model.
	self assert: model target equals: toCtrl model