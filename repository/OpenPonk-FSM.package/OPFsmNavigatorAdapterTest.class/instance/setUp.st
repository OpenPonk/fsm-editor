as yet unclassified
setUp
	super setUp.
	fsm := OPFsm named: 'FSM'.
	initialState := OPFsmInitialState named: 'initial'.
	state := OPFsmState named: 'state'.
	finalState := OPFsmState named: 'final'.
	finalState beFinal.
	firstTransition := OPFsmTransition from: initialState to: state named: 'first'.
	secondTransition := OPFsmTransition from: state to: finalState named: 'second'.
	fsm
		add: initialState;
		add: state;
		add: finalState;
		add: firstTransition;
		add: secondTransition