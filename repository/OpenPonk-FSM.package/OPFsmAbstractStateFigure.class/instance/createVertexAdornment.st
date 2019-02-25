creating
createVertexAdornment
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
				palette: self controller diagramController editor paletteModel;
				factory: [ OPFsmStateController new ];
				whenCompleted: [ :ctrl | 
					| t2 |
					t2 := OPConnectionCreationTool new
						palette: self controller diagramController editor paletteModel;
						factory: [ OPFsmTransitionController new ].
					self controller diagramController editor paletteModel selectTool: t2.
					t2
						sourceSelected: self controller;
						targetSelected: ctrl.
					self controller diagramController editor paletteModel selectedTool
						targetSelected: ctrl ].
			self controller diagramController editor paletteModel selectTool: tool ].
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