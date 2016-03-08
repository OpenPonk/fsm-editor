events - registering
registerModelEvents: aModel
	super registerModelEvents: aModel.
	aModel when: DCElementChanged do: [ :evt | self saveState ]