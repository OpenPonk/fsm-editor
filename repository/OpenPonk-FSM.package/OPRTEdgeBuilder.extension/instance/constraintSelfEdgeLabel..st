*OpenPonk-FSM
constraintSelfEdgeLabel: labelName
	| label |
	label := self labelNamed: labelName.
	constraints
		add: [ :edge | 
			(RTConstraint on: label background: edge from)
				bottomRight;
				padding: 6;
				outer;
				stick ]