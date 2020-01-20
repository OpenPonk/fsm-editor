rendering
constraintSelfEdgeLabel: labelName
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