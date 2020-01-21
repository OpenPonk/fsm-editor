"
I am help for state machine editor.

!! Opening

HelpBrowser openOn: DCFsmHelp
"
Class {
	#name : #OPFsmHelp,
	#superclass : #CustomHelp,
	#category : 'OpenPonk-FSM-Help'
}

{ #category : #accessing }
OPFsmHelp class >> bookName [ 
	^'FSM Editor help'
]

{ #category : #documentation }
OPFsmHelp class >> howto [
	^ HelpTopic 
		title: 'How To'
		contents: 
'!! ADDING STATES

To add a state click on the appropriate button in the palette, then click on the canvas to add it.
You can continue clicking on the canvas to add continue adding more states.

!! ADDING TRANSITIONS

To add a transition, click on the ''Transition'' in the palette and then click on one of the states --- the initial one. Then click on second state --- the final one.
YOu can continue clicking on states to add more transitions.

!! RENAMING STATES AND TRANSITIONS

To rename a state or a transition simply doubleclick it (with left mouse button), and rename popup will appear.

For simulator purposes, multiple transition events can be separated by commas.

!! REMOVING STATES AND TRANSITIONS

To remove a state or a transition, right click on the object and select ''Remove''. If there are transitions connected to a removed state, they will be also removed.

'
]

{ #category : #accessing }
OPFsmHelp class >> key [
	^ self name
]

{ #category : #'instance creation' }
OPFsmHelp class >> open [
	<script>
	HelpBrowser openOn: OPFsmHelp
]

{ #category : #accessing }
OPFsmHelp class >> pages [
	^#(howto simulator)
]

{ #category : #documentation }
OPFsmHelp class >> simulator [
	^ HelpTopic
		title: 'Simulator'
		contents:
			'!! LAUNCHING SIMULATOR

To launch a simulator, from top menu select section ''Editor'' and then ''Open simulator''

!! EXECUTING SIMULATION

Into the input box enter a list of terminals (words, symbols, ...) separated by comma.
'
]
