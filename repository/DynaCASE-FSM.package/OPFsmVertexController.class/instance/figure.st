figures
figure
	figure
		ifNil: [ (figure := self createFigure) renderIn: self diagramController view.
			self saveStateOnDragEndFor: figure ].
	^ figure