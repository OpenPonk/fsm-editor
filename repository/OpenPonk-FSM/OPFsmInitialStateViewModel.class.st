"
View model for the FSM initial state.
Provides icons and form building specifications to the workbench without GUI dependencies.
"
Class {
	#name : 'OPFsmInitialStateViewModel',
	#superclass : 'OPFsmVertexViewModel',
	#category : 'OpenPonk-FSM-ViewModels',
	#package : 'OpenPonk-FSM',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPFsmInitialStateViewModel class >> modelClass [ ^ OPFsmInitialState
]

{ #category : 'accessing' }
OPFsmInitialStateViewModel >> icon [ ^ OPCoreIcons opFsmInitialStateIcon
]
