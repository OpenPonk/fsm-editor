"
I am a container for simulation input represented by letter boxes.

!! Collaborators

DCFsmLetterBox
"
Class {
	#name : #OPFsmTerminalPanel,
	#superclass : #Morph,
	#category : 'OpenPonk-FSM-Simulations'
}

{ #category : #accessing }
OPFsmTerminalPanel >> changeBoxAt: anIndex to: aSymbol [

	self submorphs
		withIndexDo: [ :morph :index | 
			index < anIndex
				ifTrue: [ morph beSuccess ].
			index = anIndex
				ifTrue: [ morph perform: aSymbol ].
			index > anIndex
				ifTrue: [ morph beNormal ] ]
]

{ #category : #accessing }
OPFsmTerminalPanel >> data: aCollection [
	self submorphsDo: #delete.
	aCollection
		do: [ :terminal | self addMorphBack: (OPFsmTerminalBox new terminal: terminal) ]
]

{ #category : #initialize }
OPFsmTerminalPanel >> defaultColor [
	^ Color transparent
]

{ #category : #initialization }
OPFsmTerminalPanel >> initialize [
	super initialize.
	self
		layoutPolicy: RowLayout new;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		cellInset: 5
]
