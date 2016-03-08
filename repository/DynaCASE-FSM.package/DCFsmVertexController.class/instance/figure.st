figures
figure
	figure
		ifNil: [ (figure := self createFigure)
				renderIn: self diagramController view;
				when: TRMouseDragEnd do: [ :evt | self diagramController saveState ] ].
	^ figure element