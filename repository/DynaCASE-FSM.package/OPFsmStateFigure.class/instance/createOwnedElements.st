as yet unclassified
createOwnedElements
	self createAdornment.
	self createVertexAdornment.
	label := RTLabel new
		color: Color black;
		height: 11;
		text: [ :m | m model name ];
		elementOn: self.
	self add: label.
	(RTConstraint on: label background: self) stick.
	innerCircle := RTRoundedBox new
		size: 44;
		borderRadius: 22;
		borderWidth: 1;
		color: Color transparent;
		borderColor: Color black;
		element.
	(RTConstraint on: innerCircle background: self) stick