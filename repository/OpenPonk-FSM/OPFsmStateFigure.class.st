"
!! Responsibility

Represent a FSM state visualization.
Give option to switch between normal and final state.

!! Collaborators

none
"
Class {
	#name : #OPFsmStateFigure,
	#superclass : #OPFsmAbstractStateFigure,
	#instVars : [
		'label',
		'innerCircle'
	],
	#category : 'OpenPonk-FSM-Figures'
}

{ #category : #rendering }
OPFsmStateFigure >> addInteractions [
	self @ RTDraggable.
	self @ OPRTFocusable
]

{ #category : #accessing }
OPFsmStateFigure >> baseShape [
	^ RTRoundedBox new
		size: 50;
		borderRadius: 25;
		borderWidth: 1.5;
		color: Color white;
		borderColor: Color black
]

{ #category : #'creating - subelements' }
OPFsmStateFigure >> createOwnedElements [
	self createAdornment.
	self createVertexAdornment.
	label := RTLabel new
		color: Color black;
		height: 11;
		text: [ :m | m model ifNil: [ '' ] ifNotNil: #name ];
		elementOn: self.
	self add: label.
	(RTConstraint on: label background: self) stick.
	innerCircle := RTRoundedBox new
		size: 44;
		borderRadius: 22;
		borderWidth: 1;
		color: Color transparent;
		borderColor: Color black;
		element.
	(RTConstraint on: innerCircle background: self) stick
]

{ #category : #updating }
OPFsmStateFigure >> update [
	self show: innerCircle if: self model isFinal.
	super update
]
