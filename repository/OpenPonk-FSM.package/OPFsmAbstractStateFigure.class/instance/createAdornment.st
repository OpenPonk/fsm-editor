as yet unclassified
createAdornment
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
				palette: self controller diagramController editor paletteModel;
				factory: [ OPFsmTransitionController new ].
			self controller diagramController editor paletteModel selectTool: tool.
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