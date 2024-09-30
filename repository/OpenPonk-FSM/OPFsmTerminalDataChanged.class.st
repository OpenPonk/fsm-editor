Class {
	#name : 'OPFsmTerminalDataChanged',
	#superclass : 'Announcement',
	#instVars : [
		'data'
	],
	#category : 'OpenPonk-FSM-Simulations',
	#package : 'OpenPonk-FSM',
	#tag : 'Simulations'
}

{ #category : 'instance creation' }
OPFsmTerminalDataChanged class >> data: aString [

	^ self new
		  data: aString;
		  yourself
]

{ #category : 'accessing' }
OPFsmTerminalDataChanged >> data [

	^ data
]

{ #category : 'accessing' }
OPFsmTerminalDataChanged >> data: aString [

	data := aString
]
