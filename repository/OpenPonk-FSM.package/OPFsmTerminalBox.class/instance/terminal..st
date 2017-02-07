accessing
terminal: aSymbol
	self submorphsDo: #delete.
	self addMorph: (self morphForTerminal: aSymbol).
	self bounds: (self submorphs last bounds expandBy: 4)