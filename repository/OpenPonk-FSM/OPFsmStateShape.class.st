"
Diagram element representing an FSM state.
Manages the rendering details of its underlying Roassal shape, including the display of inner circles for final states.
"
Class {
	#name : 'OPFsmStateShape',
	#superclass : 'OPFsmAbstractStateShape',
	#instVars : [
		'label',
		'innerCircle'
	],
	#category : 'OpenPonk-FSM-DiagramElements',
	#package : 'OpenPonk-FSM',
	#tag : 'DiagramElements'
}

{ #category : 'accessing' }
OPFsmStateShape >> attachedShapes [

	^ super attachedShapes , {
		  label.
		  innerCircle }
]

{ #category : 'removing' }
OPFsmStateShape >> removeRender [

	super removeRender.
	label := nil.
	innerCircle := nil
]

{ #category : 'rendering' }
OPFsmStateShape >> renderBasicShape [

	^ RSCircle new
		  size: 60;
		  color: Color white;
		  border: (RSBorder new
				   color: Color black;
				   width: 1.5;
				   yourself);
		  yourself
]

{ #category : 'rendering' }
OPFsmStateShape >> renderShapeDetails [

	super renderShapeDetails.
	label := RSComposite new.
	RSLocation new stick: label on: self roassalShape.

	innerCircle := RSCircle new
		               size: (self roassalShape width * 0.88) asInteger;
		               color: Color transparent;
		               model: self;
		               yourself.
	RSLocation new stick: innerCircle on: self roassalShape.

	self updateLabel.

	self canvas
		add: label;
		add: innerCircle
]

{ #category : 'interactions' }
OPFsmStateShape >> selectableInteraction [

	^ super selectableInteraction
		  highlightBorderColor: Color blue;
		  yourself
]

{ #category : 'rendering' }
OPFsmStateShape >> updateLabel [

	| rawString textLines |
	label children copy do: [ :each | label removeShape: each ].
	rawString := self modelElement name ifNil: [ '' ] ifNotNil: [ :name | name asString ].
	textLines := rawString lines.
	textLines ifEmpty: [ textLines := #( '' ) ].
	label addAll: (textLines collect: [ :eachLine |
				 RSLabel new
					 text: eachLine;
					 color: Color black;
					 fontSize: 11;
					 yourself ]).
	RSVerticalLineLayout new
		alignCenter;
		verticalGap: 1;
		on: label children.
	label adjustToChildren.
	RSLocation new move: label on: self roassalShape
]

{ #category : 'rendering' }
OPFsmStateShape >> updateRenderFromModel [
	self updateLabel.
	innerCircle borderColor: (self modelElement isFinal
		ifTrue: [ Color black ]
		ifFalse: [ Color transparent ]).
	super updateRenderFromModel.
	roassalShape signalUpdate
]
