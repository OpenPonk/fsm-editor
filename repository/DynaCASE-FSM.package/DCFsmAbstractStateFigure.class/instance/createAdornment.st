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
	icon := RTBitmap new
		form: DCIcons current dcFsmTransitionIcon;
		rotation: (Float pi / 4) radiansToDegrees negated;
		element.
	(RTConstraint on: icon background: transitionHelper) stick.
	transitionHelper
		when: TRMouseLeftClick
		do: [ :evt | 
			(tool := DCConnectionCreationTool new)
				palette: self controller diagramController editor paletteModel;
				factory: [ DCFsmTransitionController new ].
			self controller diagramController editor paletteModel selectTool: tool.
			tool sourceSelected: self controller ].
	self
		when: DCTRFocused
		do: [ self
				add: transitionHelper;
				add: icon.
			self view
				add: transitionHelper;
				add: icon ].
	self
		when: DCTRUnfocused
		do: [ transitionHelper view
				ifNotNil: [ ownedElements
						remove: transitionHelper;
						remove: icon.
					transitionHelper remove.
					icon remove ] ]