running
setUp
	super setUp.
	fromCtrl := self fromClass new.
	diagramController addController: fromCtrl.
	fromCtrl createModelIn: diagramController model.
	fromCtrl renderFigureIn: diagramController view.
	toCtrl := self toClass new.
	diagramController addController: toCtrl.
	toCtrl createModelIn: diagramController model.
	toCtrl model beFinal.
	toCtrl renderFigureIn: diagramController view