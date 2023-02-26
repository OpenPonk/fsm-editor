"
!! Responsibility

Represent a FSM state visualization.
Give option to switch between normal and final state.

!! Collaborators

none
"
Class {
	#name : #OPFsmStateShape,
	#superclass : #OPFsmAbstractStateShape,
	#instVars : [
		'label',
		'innerCircle'
	],
	#category : #'OpenPonk-FSM-DiagramElements'
}

{ #category : #accessing }
OPFsmStateShape >> renderBasicShape [

	^ RSCircle new
		  size: 50;
		  color: Color white;
		  border: (RSBorder new
				   color: Color black;
				   width: 1.5;
				   yourself);
		  yourself
]

{ #category : #rendering }
OPFsmStateShape >> renderShapeDetails [

	super renderShapeDetails.

	label := RSLabel new
		         color: Color black;
		         height: 11;
		         model: self;
		         yourself.
	RSLocation new stick: label on: self roassalShape.
	innerCircle := RSCircle new
		               size: 44;
		               color: Color transparent;
		               model: self;
		               yourself.
	RSLocation new stick: innerCircle on: self roassalShape.
	self canvas
		add: label;
		add: innerCircle.
	self roassalShape when: RSShapeRemovedEvent do: [ 
		label remove.
		innerCircle remove ]
]

{ #category : #hooks }
OPFsmStateShape >> setupHighlight: aHighlightable [

	aHighlightable highlightBorderColor: Color blue
]

{ #category : #updating }
OPFsmStateShape >> updateRenderFromModel [

	label text: self modelElement name.
	innerCircle borderColor: (self modelElement isFinal
			 ifTrue: [ Color black ]
			 ifFalse: [ Color transparent ]).
	super updateRenderFromModel.
	roassalShape signalUpdate
]
