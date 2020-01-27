"
I am descriptior for FSM plugin.
"
Class {
	#name : #OPFsmPlugin,
	#superclass : #OPPlugin,
	#category : #'OpenPonk-FSM-Plugin'
}

{ #category : #toolbar }
OPFsmPlugin class >> canvasToolbarFor: aBuilder [
	<opCanvasToolbar: #OPFsmPlugin>
	(aBuilder item: 'Layout')
		action: [ OPLayoutWizard new
				controller: aBuilder model diagramController;
				open ]
]

{ #category : #toolbar }
OPFsmPlugin class >> toolbarMenu: aBuilder [
	<opEditorToolbarMenu: #OPFsmPlugin>
	(aBuilder item: 'Help')
		icon: Smalltalk ui icons help;
		action: [ HelpBrowser openOn: OPFsmHelp ]
]

{ #category : #accessing }
OPFsmPlugin >> diagramControllerClass [
	^ OPFsmController
]

{ #category : #accessing }
OPFsmPlugin >> icon [
	^ OPIcons current dcFsmDiagramIcon
]

{ #category : #accessing }
OPFsmPlugin >> modelClass [
	^ OPFsm
]

{ #category : #accessing }
OPFsmPlugin >> name [
	^ 'FSM Diagram'
]

{ #category : #accessing }
OPFsmPlugin >> serializerClass [
	^ OPFsmSerializer
]

{ #category : #'as yet unclassified' }
OPFsmPlugin >> supportsHidingElements [
	^ true
]
