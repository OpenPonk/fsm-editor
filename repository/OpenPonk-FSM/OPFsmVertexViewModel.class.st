"
Abstract view model for FSM vertices. Manages hierarchy logic and child dependencies for the workbench integration.
"
Class {
	#name : 'OPFsmVertexViewModel',
	#superclass : 'OPModelObjectViewModel',
	#category : 'OpenPonk-FSM-ViewModels',
	#package : 'OpenPonk-FSM',
	#tag : 'ViewModels'
}

{ #category : 'testing' }
OPFsmVertexViewModel class >> isAbstract [

	^ self = OPFsmVertexViewModel
]

{ #category : 'accessing' }
OPFsmVertexViewModel class >> modelClass [ ^ OPFsmVertex
]

{ #category : 'accessing' }
OPFsmVertexViewModel >> childrenModels [ ^ self model incoming asArray , self model outgoing asArray
]

{ #category : 'accessing' }
OPFsmVertexViewModel >> dependentElements [

	^ (self model incoming , self model outgoing) asSet
]
