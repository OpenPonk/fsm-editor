testing - instance creation
createController
	^ super createController
		model: self modelClass new;
		yourself