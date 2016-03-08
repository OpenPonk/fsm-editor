accessing
persistenceManager
	^ persistenceManager ifNil: [ persistenceManager := DCFsmPersistenceManager new ]