"
A DCFsmStateController is a controller for a state in FSM.

"
Class {
	#name : #OPFsmStateController,
	#superclass : #OPFsmVertexController,
	#category : #'OpenPonk-FSM-Controllers'
}

{ #category : #hooks }
OPFsmStateController >> buildEditorForm: aForm [
	super buildEditorForm: aForm.
	(aForm addCheckbox: 'Final')
		state: self model isFinal;
		whenChangedDo: [ :newValue | 
			self model isFinal: newValue.
			self refreshFigure ]
]

{ #category : #figures }
OPFsmStateController >> createFigure [
	^ (OPFsmStateFigure on: self model)
		controller: self;
		yourself
]

{ #category : #accessing }
OPFsmStateController >> modelClass [
	^ OPFsmState
]

{ #category : #figures }
OPFsmStateController >> refreshFigure [
	figure update.
	^ self figure
]
