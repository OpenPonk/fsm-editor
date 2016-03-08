undo/redo
saveState
	| memento |
	memento := DCFsmPersistenceMemento model: self model layout: self layout.
	self persistenceManager saveState: memento.
	self editor updateUndoRedo.
	self editor workbench projectController autoSave: memento