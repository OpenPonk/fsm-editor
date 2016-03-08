undo/redo
saveState
	self persistenceManager
		saveState: (DCFsmPersistenceMemento model: self model layout: self layout).
	self editor updateUndoRedo