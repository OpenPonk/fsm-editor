"
I am a figure for FSM initial state.
"
Class {
	#name : #OPFsmInitialStateShape,
	#superclass : #OPFsmAbstractStateShape,
	#category : #'OpenPonk-FSM-DiagramElements'
}

{ #category : #rendering }
OPFsmInitialStateShape >> addInteractions [
	self @ RTDraggable.
	self @ OPRTFocusable
]

{ #category : #'instance creation' }
OPFsmInitialStateShape >> baseShape [
	^ RTEllipse new
		size: 14;
		color: Color black
]

{ #category : #'creating - subelements' }
OPFsmInitialStateShape >> createOwnedElements [
	self createAdornment.
	self createVertexAdornment
]
