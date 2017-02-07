actions
preconditions
	diagramController model states
		detect: #isInitial
		ifNone: [ UIManager default abort: 'No initial state has been defined.'.
			^ false ].
	(diagramController model states detect: #isInitial) outgoing isEmpty
		ifTrue: [ UIManager default abort: 'No outgoing transitions from initial state.'.
			^ false ].
	^ true