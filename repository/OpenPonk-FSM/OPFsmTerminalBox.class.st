"
I am a box containing a terminal symbol of the input.

!! Collaborators

DCFsmTerminalPanel
"
Class {
	#name : #OPFsmTerminalBox,
	#superclass : #BorderedMorph,
	#instVars : [
		'colors'
	],
	#category : 'OpenPonk-FSM-Simulations'
}

{ #category : #accessing }
OPFsmTerminalBox >> beFailure [
	self borderColor: Color red.
	self color: (colors at: #failure)
]

{ #category : #accessing }
OPFsmTerminalBox >> beNormal [
	self borderColor: Color black.
	self color: (colors at: #normal)
]

{ #category : #accessing }
OPFsmTerminalBox >> beProcessed [
	self borderColor: Color orange.
	self color: (colors at: #processed)
]

{ #category : #accessing }
OPFsmTerminalBox >> beSuccess [
	self borderColor: Color green muchDarker.
	self color: (colors at: #success)
]

{ #category : #initialization }
OPFsmTerminalBox >> defaultBorderColor [
	^ Color black
]

{ #category : #initialization }
OPFsmTerminalBox >> defaultBorderWidth [
	^ 1
]

{ #category : #initialization }
OPFsmTerminalBox >> defaultBounds [
	^ 0 @ 0 corner: 25 @ 25
]

{ #category : #initialization }
OPFsmTerminalBox >> defaultColor [
	^ Smalltalk ui theme windowColor
]

{ #category : #initialization }
OPFsmTerminalBox >> initialize [
	super initialize.
	self initializeColorScheme.
	self
		layoutPolicy: StackLayout new;
		cellPositioning: #center;
		cellInset: 5.
]

{ #category : #initialization }
OPFsmTerminalBox >> initializeColorScheme [
	colors := {(#normal -> Smalltalk ui theme windowColor).
	(#processed -> Color paleOrange).
	(#failure -> Color paleRed).
	(#success -> Color paleGreen)} asDictionary.
	Smalltalk ui theme class = Pharo3DarkTheme
		ifTrue:
			[ colors := {(#normal -> Smalltalk ui theme windowColor).
			(#processed -> Color paleOrange muchDarker).
			(#failure -> Color paleRed muchDarker).
			(#success -> Color paleGreen muchDarker)} asDictionary ]
]

{ #category : #accessing }
OPFsmTerminalBox >> morphForTerminal: aSymbol [
	^ aSymbol asMorph
]

{ #category : #accessing }
OPFsmTerminalBox >> terminal: aSymbol [
	self submorphsDo: #delete.
	self addMorph: (self morphForTerminal: aSymbol).
	self bounds: (self submorphs last bounds expandBy: 4)
]
