"
View model for the top-level FSM model. Provides essential child models and icon definitions for the workbench tree and UI integration.
"
Class {
	#name : 'OPFsmViewModel',
	#superclass : 'OPModelObjectViewModel',
	#category : 'OpenPonk-FSM-ViewModels',
	#package : 'OpenPonk-FSM',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPFsmViewModel class >> commonModelClassPrefix [

	^ 'OPFsm'
]

{ #category : 'accessing' }
OPFsmViewModel class >> modelClass [ ^ OPFsm
]

{ #category : 'accessing' }
OPFsmViewModel >> childrenModels [ ^ self model states
]

{ #category : 'accessing' }
OPFsmViewModel >> essentialChildrenModels [
			^ self model elements asArray
]

{ #category : 'accessing' }
OPFsmViewModel >> icon [ ^ OPCoreIcons opFsmDiagramIcon
]

{ #category : 'accessing' }
OPFsmViewModel >> modelRootViewModel [

	^ self
]
