construction
createModelIn: aParentModel
	self model: self modelClass new.
	aParentModel add: model.
	^ model