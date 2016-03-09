initialization
initialize
	super initialize.
	self initializeColorScheme.
	self
		layoutPolicy: StackLayout new;
		cellPositioning: #center;
		cellInset: 5.