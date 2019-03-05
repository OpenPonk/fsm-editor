construction
createModelIn: aParentModel
	model := self modelClass new.
	aParentModel add: model.
	^ model