"
Controller for FSM transitions.
Manages the diagram lifecycle and interactions for directional edges connecting states.
"
Class {
	#name : 'OPFsmTransitionController',
	#superclass : 'OPDirectionalRelationshipController',
	#category : 'OpenPonk-FSM-Controllers',
	#package : 'OpenPonk-FSM',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPFsmTransitionController class >> diagramElementClass [

	^ OPFsmTransitionShape
]

{ #category : 'accessing' }
OPFsmTransitionController class >> viewModelClass [
	^ OPFsmTransitionViewModel
]
