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
		icon: OPCoreIcons opFsmDiagramIcon;
		action: [ HelpBrowser openOn: OPFsmHelp ]
]

{ #category : #accessing }
OPFsmPlugin >> diagramControllerClass [
	^ OPFsmController
]

{ #category : #accessing }
OPFsmPlugin >> icon [
	^ OPCoreIcons opFsmDiagramIcon
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
OPFsmPlugin >> modelSerializerClass [
	^ OPFsmModelSerializer
]

{ #category : #accessing }
OPFsmPlugin >> name [
	^ 'FSM Diagram'
]

{ #category : #'as yet unclassified' }
OPFsmPlugin >> supportsHidingElements [
	^ true
]
