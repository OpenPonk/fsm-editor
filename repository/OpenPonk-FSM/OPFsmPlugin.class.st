"
I am descriptior for FSM plugin.
"
Class {
	#name : #OPFsmPlugin,
	#superclass : #OPPlugin,
	#category : #'OpenPonk-FSM-Plugin'
}

{ #category : #toolbar }
OPFsmPlugin class >> toolbarMenu: aBuilder [
	<opEditorToolbarMenu: #OPFsmPlugin>
	(aBuilder item: 'Help')
		icon: (self iconNamed: #help);
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

{ #category : #'as yet unclassified' }
OPFsmPlugin >> layouterClass [
	^ OPFsmLayouter
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
