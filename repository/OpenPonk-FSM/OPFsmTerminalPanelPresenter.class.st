Class {
	#name : 'OPFsmTerminalPanelPresenter',
	#superclass : 'SpAbstractWidgetPresenter',
	#instVars : [
		'data'
	],
	#category : 'OpenPonk-FSM-Simulations',
	#package : 'OpenPonk-FSM',
	#tag : 'Simulations'
}

{ #category : 'specs' }
OPFsmTerminalPanelPresenter class >> adapterName [

	^ #OPFsmTerminalPanelAdapter
]

{ #category : 'accessing' }
OPFsmTerminalPanelPresenter >> changeBoxAt: aPosition to: aState [

	self announce:
		(OPFsmTerminalRecognizerStateChanged at: aPosition to: aState)
]

{ #category : 'accessing' }
OPFsmTerminalPanelPresenter >> data [

	^ data
]

{ #category : 'accessing' }
OPFsmTerminalPanelPresenter >> data: aString [

	data := aString.
	self announce: (OPFsmTerminalDataChanged data: data)
]

{ #category : 'event handling' }
OPFsmTerminalPanelPresenter >> whenDataChangedDo: aBlock [

	self announcer when: OPFsmTerminalDataChanged do: aBlock
]

{ #category : 'event handling' }
OPFsmTerminalPanelPresenter >> whenRecognizerStateChangedDo: aBlock [

	self announcer when: OPFsmTerminalRecognizerStateChanged do: aBlock
]
