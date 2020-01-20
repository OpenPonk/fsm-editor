rendering
constraintLabel: labelName balance: aFloat offset: aNumber
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