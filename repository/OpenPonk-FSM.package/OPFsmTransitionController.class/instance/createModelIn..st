construction
createModelIn: aParentModel
	self model: self modelClass new.
	model source: self source model.
	model target: self target model.
	self source diagramController model add: model.
	^ model