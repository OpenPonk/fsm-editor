import-export
importFrom: aFolder
	| import |
	import := DCFsmGraphML new import: aFolder / self storageFile.
	^ DCFsmPersistenceMemento model: (import at: #model) layout: (import at: #layout)