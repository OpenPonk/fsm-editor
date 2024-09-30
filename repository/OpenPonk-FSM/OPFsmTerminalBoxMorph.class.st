"
I am a box containing a terminal symbol of the input.

!! Collaborators

DCFsmTerminalPanel
"
Class {
	#name : 'OPFsmTerminalBoxMorph',
	#superclass : 'BorderedMorph',
	#instVars : [
		'colors'
	],
	#category : 'OpenPonk-FSM-Simulations',
	#package : 'OpenPonk-FSM',
	#tag : 'Simulations'
}

{ #category : 'initialization' }
OPFsmTerminalBoxMorph >> defaultBorderColor [
	^ Color black
]

{ #category : 'initialization' }
OPFsmTerminalBoxMorph >> defaultBorderWidth [
	^ 1
]

{ #category : 'initialization' }
OPFsmTerminalBoxMorph >> defaultBounds [
	^ 0 @ 0 corner: 25 @ 25
]

{ #category : 'initialization' }
OPFsmTerminalBoxMorph >> defaultColor [
	^ Smalltalk ui theme windowColor
]

{ #category : 'accessing' }
OPFsmTerminalBoxMorph >> failure [
	self borderColor: Color red.
	self color: (colors at: #failure)
]

{ #category : 'initialization' }
OPFsmTerminalBoxMorph >> initialize [
	super initialize.
	self initializeColorScheme.
	self
		layoutPolicy: StackLayout new;
		cellPositioning: #center;
		cellInset: 5.
]

{ #category : 'initialization' }
OPFsmTerminalBoxMorph >> initializeColorScheme [

	colors := { 
		          (#normal -> Smalltalk ui theme windowColor).
		          (#processed -> Color paleOrange).
		          (#failure -> Color paleRed).
		          (#success -> Color paleGreen) } asDictionary.
	Smalltalk ui theme class = PharoDarkTheme ifTrue: [ 
		colors := { 
			          (#normal -> Smalltalk ui theme windowColor).
			          (#processed -> Color paleOrange muchDarker).
			          (#failure -> Color paleRed muchDarker).
			          (#success -> Color paleGreen muchDarker) } asDictionary ]
]

{ #category : 'accessing' }
OPFsmTerminalBoxMorph >> morphForTerminal: aSymbol [
	^ aSymbol asMorph
]

{ #category : 'accessing' }
OPFsmTerminalBoxMorph >> normal [
	self borderColor: Color black.
	self color: (colors at: #normal)
]

{ #category : 'accessing' }
OPFsmTerminalBoxMorph >> processed [
	self borderColor: Color orange.
	self color: (colors at: #processed)
]

{ #category : 'accessing' }
OPFsmTerminalBoxMorph >> success [
	self borderColor: Color green muchDarker.
	self color: (colors at: #success)
]

{ #category : 'accessing' }
OPFsmTerminalBoxMorph >> terminal: aSymbol [
	self submorphsDo: #delete.
	self addMorph: (self morphForTerminal: aSymbol).
	self bounds: (self submorphs last bounds expandBy: 4)
]
