"
I am a figure for FSM initial state.
"
Class {
	#name : #OPFsmInitialStateFigure,
	#superclass : #OPFsmAbstractStateFigure,
	#category : 'OpenPonk-FSM-Figures'
}

{ #category : #rendering }
OPFsmInitialStateFigure >> addInteractions [
	self @ RTDraggable.
	self @ OPRTFocusable
]

{ #category : #'instance creation' }
OPFsmInitialStateFigure >> baseShape [
	^ RTEllipse new
		size: 14;
		color: Color black
]

{ #category : #'creating - subelements' }
OPFsmInitialStateFigure >> createOwnedElements [
	self createAdornment.
	self createVertexAdornment
]
