tests
testCreateModel
	self class = OPFsmVertexControllerTest
		ifTrue: [ ^ self ].
	self assert: ctrl createModel class equals: self modelClass