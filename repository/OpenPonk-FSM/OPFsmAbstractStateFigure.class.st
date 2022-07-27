"
I am a base class for FSM vertex figures and I provide basic adornment behavior.
"
Class {
	#name : #OPFsmAbstractStateFigure,
	#superclass : #RTAbstractMultiElement,
	#instVars : [
		'controller'
	],
	#category : #'OpenPonk-FSM-Figures'
}

{ #category : #accessing }
OPFsmAbstractStateFigure >> controller [
	^ controller
]

{ #category : #accessing }
OPFsmAbstractStateFigure >> controller: anObject [
	controller := anObject
]

{ #category : #creating }
OPFsmAbstractStateFigure >> createAdornment [
	| tool icon transitionHelper |
	transitionHelper := RTBox new
		size: 20;
		color: Color white;
		borderColor: Color veryVeryLightGray;
		element.
	(RTConstraint on: transitionHelper background: self)
		bottom;
		right;
		outer;
		stick.
	icon := RTSVGPath new
		path: 'M-6,6 L6,-6 L4,2 M6,-6 L-2,-4';
		element.
	(RTConstraint on: icon background: transitionHelper) stick.
	transitionHelper
		when: TRMouseLeftClick
		do: [ :evt | 
			(tool := OPConnectionCreationTool new)
				palette: self controller diagramController editor palette;
				factory: [ OPFsmTransitionController new ].
			self controller diagramController editor palette selectTool: tool.
			tool sourceSelected: self controller ].
	self
		when: OPTRFocused
		do: [ self
				add: transitionHelper;
				add: icon.
			self view
				add: transitionHelper;
				add: icon ].
	self
		when: OPTRUnfocused
		do: [ transitionHelper view
				ifNotNil: [ ownedElements
						remove: transitionHelper;
						remove: icon.
					transitionHelper remove.
					icon remove ] ]
]

{ #category : #creating }
OPFsmAbstractStateFigure >> createVertexAdornment [
	| tool icon transitionHelper |
	transitionHelper := RTBox new
		size: 20;
		color: Color white;
		borderColor: Color veryVeryLightGray;
		element.
	(RTConstraint on: transitionHelper background: self)
		bottom;
		right;
		outer;
		verticalPadding: -20;
		stick.
	icon := RTEllipse new
		color: Color transparent;
		borderColor: Color black;
		size: 14;
		element.
	(RTConstraint on: icon background: transitionHelper) stick.
	transitionHelper
		when: TRMouseLeftClick
		do: [ :evt | 
			(tool := OPCreationTool new)
				palette: self controller diagramController editor palette;
				factory: [ OPFsmStateController new ];
				whenCreated: [ :ctrl | 
					| t2 |
					t2 := OPConnectionCreationTool new
						palette: self controller diagramController editor palette;
						factory: [ OPFsmTransitionController new ].
					self controller diagramController editor palette selectTool: t2.
					t2
						sourceSelected: self controller;
						targetSelected: ctrl.
					self controller diagramController editor palette selectedTool
						targetSelected: ctrl ].
			self controller diagramController editor palette selectTool: tool ].
	self
		when: OPTRFocused
		do: [ self
				add: transitionHelper;
				add: icon.
			self view
				add: transitionHelper;
				add: icon ].
	self
		when: OPTRUnfocused
		do: [ transitionHelper view
				ifNotNil: [ ownedElements
						remove: transitionHelper;
						remove: icon.
					transitionHelper remove.
					icon remove ] ]
]
