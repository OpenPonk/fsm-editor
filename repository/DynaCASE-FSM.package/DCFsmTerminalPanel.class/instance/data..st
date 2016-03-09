accessing
data: aCollection
	self submorphsDo: #delete.
	aCollection
		do: [ :terminal | self addMorphBack: (DCFsmTerminalBox new terminal: terminal) ]