import-export
export: aMemento to: aFolder
	(aFolder / self storageFile) ensureDelete
		writeStreamDo: [ :stream | 
			stream
				wantsLineEndConversion: true;
				nextPutAll: (DCFsmGraphML new export: aMemento model withLayout: aMemento layout) ]