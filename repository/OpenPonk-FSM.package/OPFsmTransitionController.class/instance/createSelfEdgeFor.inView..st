figures
createSelfEdgeFor: anElement inView: view
	| aLabel aFigure |
	aFigure := OPRTArcLine new
		color: Color black;
		radius: 15;
		head: RTFilledNarrowArrow;
		edgeFrom: anElement to: anElement.

	aLabel := RTLabel new
		color: Color black;
		height: 10;
		elementOn: ''.
	aFigure attributeAt: #DCArcLabel put: aLabel.
	OPRTArcLine constraintLabel: aLabel at: aFigure.
	
	aFigure trachelShape addCallback: (TRRemoveCallback with: aLabel).
	
	view add: aLabel.

	aFigure @ OPRTFocusable.
	^ aFigure