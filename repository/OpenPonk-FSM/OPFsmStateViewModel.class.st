"
View model for FSM states.
Provides icons and form building specifications to the workbench without GUI dependencies.
"
Class {
	#name : 'OPFsmStateViewModel',
	#superclass : 'OPFsmVertexViewModel',
	#category : 'OpenPonk-FSM-ViewModels',
	#package : 'OpenPonk-FSM',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPFsmStateViewModel class >> modelClass [ ^ OPFsmState
]

{ #category : 'building' }
OPFsmStateViewModel >> buildEditorForm: aForm [
	aForm bindTextInput: 'Name' property: #name.
	aForm bindCheckbox: 'Final' property: #isFinal
]

{ #category : 'accessing' }
OPFsmStateViewModel >> icon [ ^ self model isNormal ifTrue: [ OPCoreIcons opFsmRegularStateIcon ] ifFalse: [ OPCoreIcons opFsmFinalStateIcon ]
]
