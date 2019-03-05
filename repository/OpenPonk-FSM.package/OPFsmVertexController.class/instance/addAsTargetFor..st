adding
addAsTargetFor: aTransitionController
	self assert: (self canBeTargetFor: aTransitionController).
	aTransitionController target: self.
	aTransitionController createModelIn: self model andShowInDiagram: self diagramController.
	self model owner add: aTransitionController model