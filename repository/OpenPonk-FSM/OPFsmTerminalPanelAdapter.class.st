Class {
	#name : 'OPFsmTerminalPanelAdapter',
	#superclass : 'SpAbstractMorphicAdapter',
	#instVars : [
		'morph'
	],
	#category : 'OpenPonk-FSM-Simulations',
	#package : 'OpenPonk-FSM',
	#tag : 'Simulations'
}

{ #category : 'accessing' }
OPFsmTerminalPanelAdapter class >> adaptingName [

	^ self name copyReplaceAll: 'Morphic' with: ''
]

{ #category : 'factory' }
OPFsmTerminalPanelAdapter >> buildWidget [

	morph := OPFsmTerminalPanelMorph new
		         data: self presenter data;
		         listDirection: #leftToRight;
		         layoutPolicy: RowLayout new;
		         hResizing: #spaceFill;
		         vResizing: #shrinkWrap;
		         cellInset: 5;
		         yourself.
	self model
		whenRecognizerStateChangedDo: [ :event | 
			morph changeBoxAt: event inputPosition to: event inputState ] for: self;
		whenDataChangedDo: [ :event | morph data: event data ] for: self.
	^ morph
]
