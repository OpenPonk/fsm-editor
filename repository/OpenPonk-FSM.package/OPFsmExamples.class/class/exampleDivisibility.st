examples
exampleDivisibility
	| project fsm initial zero one two |
	project := OPProject named: 'FSM Example'.
	fsm := OPFsm named: 'Divisibility By Three'.
	project addModel: fsm.
	initial := OPFsmInitialState new.
	zero := OPFsmState named: '%3=0'.
	zero beFinal.
	one := OPFsmState named: '%3=1'.
	two := OPFsmState named: '%3=2'.
	fsm
		add: initial;
		add: zero;
		add: one;
		add: two.

	fsm
		addAll:
			{(initial -> zero).
			(zero -> zero name: '0').
			(zero -> one name: '1').
			(one -> zero name: '1').
			(one -> two name: '0').
			(two -> one name: '0').
			(two -> two name: '1')}.

	OPWorkbench openProject: project