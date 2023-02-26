"
I am a figure for FSM initial state.
"
Class {
	#name : #OPFsmInitialStateShape,
	#superclass : #OPFsmAbstractStateShape,
	#category : #'OpenPonk-FSM-DiagramElements'
}

{ #category : #'instance creation' }
OPFsmInitialStateShape >> renderBasicShape [

	^ RSCircle new
		  size: 14;
		  color: Color black
]

{ #category : #hooks }
OPFsmInitialStateShape >> setupHighlight: aHighlightable [

	aHighlightable highlightColor: Color blue
]
