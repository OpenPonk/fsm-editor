events
registerInteractions
	super registerInteractions.
	self background
		when: TRMouseDoubleLeftClick
		do: [ :evt | DCRenameElementCommand executeOn: realModel ]