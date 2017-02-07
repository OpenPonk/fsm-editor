accessing
data: aCollection
	self submorphsDo: #delete.
	aCollection
		do: [ :terminal | self addMorphBack: (OPFsmTerminalBox new terminal: terminal) ]