tests
testFigureRefresh
	ctrl model: ctrl createModel.
	ctrl figure: self renderFigure.
	self assert: ctrl figure model name equals: ''.
	ctrl model name: 'new name'.
	ctrl refreshFigure.
	self assert: ctrl figure ownedElements first trachelShape text equals: 'new name'