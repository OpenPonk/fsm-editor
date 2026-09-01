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

{ #category : 'forms' }
OPFsmStateViewModel >> buildEditorForm: aForm [

	super buildEditorForm: aForm.
	(aForm addCheckbox: 'Final')
		state: self model isFinal;
		whenChangedDo: [ :newValue |
			self model isFinal: newValue.
			self modelChanged ]
]

{ #category : 'accessing' }
OPFsmStateViewModel >> icon [ ^ self model isNormal ifTrue: [ OPCoreIcons opFsmRegularStateIcon ] ifFalse: [ OPCoreIcons opFsmFinalStateIcon ]
]
