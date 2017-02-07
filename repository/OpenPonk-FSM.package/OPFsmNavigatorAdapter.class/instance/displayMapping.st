widget API
displayMapping
	^ {(OPFsm -> 'Diagram').
	(OPFsmInitialState -> 'Initial State').
	(OPFsmState
		-> [ :o | 
			o isNormal
				ifTrue: [ 'State' ]
				ifFalse: [ 'Final State' ] ]).
	(OPFsmTransition -> 'Transition')}