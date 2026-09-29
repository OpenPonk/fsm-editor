"
A model command that opens the interactive FSM simulation window for the active state machine diagram.
"
Class {
	#name : 'OPFsmOpenSimulatorCommand',
	#superclass : 'OPFsmCommand',
	#category : 'OpenPonk-FSM-Simulations',
	#package : 'OpenPonk-FSM',
	#tag : 'Simulations'
}

{ #category : 'activation' }
OPFsmOpenSimulatorCommand class >> modelMenuActivation [
	<classAnnotation>
	^ OPModelMenuActivation
		byItemOf: OPModelBasicMenuGroup
		order: 10
		for: OPEditor
]

{ #category : 'accessing' }
OPFsmOpenSimulatorCommand >> defaultMenuIcon [
	"Answers the icon form for the FSM simulator command."
	^ OPFsmIcons opFsmDiagramIcon
]

{ #category : 'accessing' }
OPFsmOpenSimulatorCommand >> defaultMenuItemName [
	"Answers the display name of the FSM simulator command."
	^ 'Open Simulator'
]

{ #category : 'execution' }
OPFsmOpenSimulatorCommand >> execute [
	"Opens the FSM simulator on the active diagram controller."
	OPFsmSimulator new openOn: self diagramController
]
