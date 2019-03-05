tests
testCreateModel
	self assert: (controller createModelIn: diagramController model) class equals: self modelClass