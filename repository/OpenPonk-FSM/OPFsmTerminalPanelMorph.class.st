"
I am a container for simulation input represented by letter boxes.

!! Collaborators

DCFsmLetterBox
"
Class {
	#name : 'OPFsmTerminalPanelMorph',
	#superclass : 'Morph',
	#category : 'OpenPonk-FSM-Simulations',
	#package : 'OpenPonk-FSM',
	#tag : 'Simulations'
}

{ #category : 'accessing' }
OPFsmTerminalPanelMorph >> changeBoxAt: anIndex to: aSymbol [

	self submorphs withIndexDo: [ :morph :index | 
		index < anIndex ifTrue: [ morph success ].
		index = anIndex ifTrue: [ morph perform: aSymbol ].
		index > anIndex ifTrue: [ morph normal ] ]
]

{ #category : 'accessing' }
OPFsmTerminalPanelMorph >> data: aCollection [
	self submorphsDo: #delete.
	aCollection
		do: [ :terminal | self addMorphBack: (OPFsmTerminalBoxMorph new terminal: terminal) ]
]

{ #category : 'initialize' }
OPFsmTerminalPanelMorph >> defaultColor [
	^ Color transparent
]

{ #category : 'initialization' }
OPFsmTerminalPanelMorph >> initialize [
	super initialize.
	self
		layoutPolicy: RowLayout new;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		cellInset: 5
]
