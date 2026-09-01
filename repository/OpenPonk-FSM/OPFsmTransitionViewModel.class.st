"
View model for FSM transitions.
Handles model attachment logic between source and target states, and provides icons for the UI layer.
"
Class {
	#name : 'OPFsmTransitionViewModel',
	#superclass : 'OPDirectedAssociationViewModel',
	#category : 'OpenPonk-FSM-ViewModels',
	#package : 'OpenPonk-FSM',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPFsmTransitionViewModel class >> modelClass [ ^ OPFsmTransition
]

{ #category : 'construction' }
OPFsmTransitionViewModel >> attachModelFrom: sourceViewModel to: targetViewModel [
	self model source: sourceViewModel model.
	self model target: targetViewModel model.
]

{ #category : 'accessing' }
OPFsmTransitionViewModel >> icon [ ^ OPCoreIcons opFsmTransitionIcon
]
