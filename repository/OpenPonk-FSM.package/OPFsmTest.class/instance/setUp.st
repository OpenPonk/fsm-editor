as yet unclassified
setUp
	diagram := OPFsm named: 'Diagram'.
	initial := OPFsmInitialState named: 'initial'.
	(final := OPFsmState named: 'final') beFinal.
	state := OPFsmState named: 'state'.
	firstTransition := OPFsmTransition from: initial to: state named: 'first'.
	secondTransition := OPFsmTransition from: state to: final named: 'second'.
	selfTransition := OPFsmTransition from: state to: state named: 'self'