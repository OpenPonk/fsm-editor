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

{ #category : #rendering }
OPFsmStateShape >> addInteractions [
	self @ RTDraggable.
	self @ OPRTFocusable
]

{ #category : #accessing }
OPFsmStateShape >> baseShape [
	^ RTEllipse new
		size: 50;
		borderWidth: 1.5;
		color: Color white;
		borderColor: Color black
]

{ #category : #'creating - subelements' }
OPFsmStateShape >> createOwnedElements [
	self createAdornment.
	self createVertexAdornment.
	label := RTLabel new
		color: Color black;
		height: 11;
		text: [ :m | m model ifNil: [ '' ] ifNotNil: #name ];
		elementOn: self.
	self add: label.
	(RTConstraint on: label background: self) stick.
	innerCircle := RTEllipse new
		size: 44;
		borderWidth: 1;
		color: Color transparent;
		borderColor: Color black;
		element.
	(RTConstraint on: innerCircle background: self) stick
]

{ #category : #updating }
OPFsmStateShape >> update [
	self show: innerCircle if: self model isFinal.
	super update
]
