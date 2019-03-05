removing
removeFull
	self model relatedElements
		do: [ :each | (self diagramController controllerForModel: each) removeFull ].
	super removeFull