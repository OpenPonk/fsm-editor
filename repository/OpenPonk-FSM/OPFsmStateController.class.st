"
A DCFsmStateController is a controller for a state in FSM.

"
Class {
	#name : 'OPFsmStateController',
	#superclass : 'OPFsmVertexController',
	#category : 'OpenPonk-FSM-Controllers',
	#package : 'OpenPonk-FSM',
	#tag : 'Controllers'
}

{ #category : 'forms' }
OPFsmStateController >> buildEditorForm: aForm [

	super buildEditorForm: aForm.
	(aForm addCheckbox: 'Final')
		state: self model isFinal;
		whenChangedDo: [ :newValue |
			self model isFinal: newValue.
			self diagramElement modelChanged ]
]

{ #category : 'construction' }
OPFsmStateController >> diagramElementClass [

	^ OPFsmStateShape
]

{ #category : 'accessing' }
OPFsmStateController >> modelClass [
	^ OPFsmState
]
