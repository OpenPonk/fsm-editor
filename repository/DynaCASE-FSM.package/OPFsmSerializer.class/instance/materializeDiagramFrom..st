serialize/materialize
materializeDiagramFrom: aString
	^ (STON reader
		allowComplexMapKeys: true;
		on: aString readStream) next