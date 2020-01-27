"
A DCFsmTransitionController is a controller for a transition in FSM.

"
Class {
	#name : #OPFsmTransitionController,
	#superclass : #OPDirectionalRelationshipController,
	#category : #'OpenPonk-FSM-Controllers'
}

{ #category : #rendering }
OPFsmTransitionController >> addLabels [
	self source = self target
		ifTrue: [ self constraintSelfEdgeLabel: #name ]
		ifFalse: [ self constraintLabel: #name balance: 0.2 offset: 12 ].
	figure
		when: TRMouseDoubleLeftClick
		do: [ :evt | OPRenameElementCommand executeOn: self model ].
	(figure labels at: #name)
		when: TRMouseDoubleLeftClick
		do: [ :evt | OPRenameElementCommand executeOn: self model ]
]

{ #category : #rendering }
OPFsmTransitionController >> constraintLabel: labelName balance: aFloat offset: aNumber [
	| label |
	label := (RTLabel new
		height: 10;
		color: figure shape color;
		text: self model name;
		element)
		@ RTDraggable;
		yourself.
	label model: figure.
	figure trachelShape
		addCallback:
			(TRRemoveCallback new
				block: [ :removedShape | 
					figure labels removeKey: labelName.
					label remove ]).
	figure labels at: labelName put: label.
	label renderIn: figure view.
	OPRTEdgeAlongConstraint
		stick: label
		alongEdge: figure
		balance: aFloat
		offset: aNumber.
	OPRTElementsConstraint
		whenDragging: label
		drawLineToPoint: [ label position
				nearestPointOnLineFrom: (figure shape startingPointOf: figure)
				to: (figure shape endingPointOf: figure) ]
]

{ #category : #rendering }
OPFsmTransitionController >> constraintSelfEdgeLabel: labelName [
	| label |
	label := (RTLabel new
		height: 10;
		color: figure shape color;
		text: self model name;
		element)
		@ RTDraggable;
		yourself.
	label model: figure.
	figure trachelShape
		addCallback:
			(TRRemoveCallback new
				block: [ :removedShape | 
					figure labels removeKey: labelName.
					label remove ]).
	figure labels at: labelName put: label.
	label renderIn: figure view.
	OPRTEdgeAlongConstraint
		stick: label
		alongEdge: figure
		offset: figure encompassingRectangle width / 2 negated.
	OPRTElementsConstraint
		whenDragging: label
		drawLineToPoint: [ | spaceTakenByEdge |
			spaceTakenByEdge := figure trachelShape encompassingRectangle.
			spaceTakenByEdge center * 2
				- (spaceTakenByEdge pointNearestTo: figure from center) ]
]

{ #category : #figures }
OPFsmTransitionController >> createEdgeFrom: fromElement to: toElement [
	^ OPRTStyledMultiLine new
		color: Color black;
		arrowHead;
		attachPoint: (RTBorderAttachPoint new offset: -10);
		edgeFrom: fromElement to: toElement
]

{ #category : #'canvas actions' }
OPFsmTransitionController >> hideSelectionFeedback [
	self figure view
		ifNotNil: [ self figure announce: OPTRUnfocused.
			self figure view signalUpdate ]
]

{ #category : #announcements }
OPFsmTransitionController >> internalSubscribeTo: aModel [
	super internalSubscribeTo: aModel.
	aModel when: OPElementRemoved do: [ :e | self removeController ]
]

{ #category : #testing }
OPFsmTransitionController >> isHideable [
	^ true
]

{ #category : #accessing }
OPFsmTransitionController >> modelClass [
	^ OPFsmTransition
]

{ #category : #figures }
OPFsmTransitionController >> refreshFigure [
	self figure ifNil: [ ^ self ].
	(figure labels at: #name) trachelShape text: self model name.
	super refreshFigure
]

{ #category : #destruction }
OPFsmTransitionController >> removeModel [
	self diagramController model remove: self model
]

{ #category : #rendering }
OPFsmTransitionController >> renderFigureIn: aView [
	figure := self
		createEdgeFrom: self source figure
		to: self target figure.
	figure renderIn: aView.
	self addLabels.
	self diagramController figureAdded: figure.
	^ figure
]

{ #category : #construction }
OPFsmTransitionController >> showInDiagram: aDiagramController [
	source
		ifNil: [ self source: (aDiagramController showInDiagramModel: model source) ].
	target
		ifNil: [ self target: (aDiagramController showInDiagramModel: model target) ].
	^ super showInDiagram: aDiagramController
]

{ #category : #'canvas actions' }
OPFsmTransitionController >> showSelectionFeedback [
	self figure announce: OPTRFocused.
	self figure view signalUpdate
]

{ #category : #construction }
OPFsmTransitionController >> showWithDependentInDiagram: aDiagramController [
	source
		ifNil: [ self source: (aDiagramController showInDiagramModel: model source) ].
	target
		ifNil: [ self target: (aDiagramController showInDiagramModel: model target) ].
	^ super showWithDependentInDiagram: aDiagramController
]
