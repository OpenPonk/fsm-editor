examples
exampleDecimal
	| project fsm initial z b c d k isDigit |
	project := OPProject named: 'FSM Example'.
	fsm := OPFsm named: 'Decimal number'.
	project addModel: fsm.
	initial := OPFsmInitialState new.
	z := OPFsmState named: 'Z'.
	b := OPFsmState named: 'B'.
	(c := OPFsmState named: 'C') beFinal.
	d := OPFsmState named: 'D'.
	(k := OPFsmState named: 'K') beFinal.
	fsm
		add: initial;
		add: z;
		add: b;
		add: c;
		add: d;
		add: k.

	fsm
		addAll:
			{(initial -> z).
			(z -> b name: '+').
			(z -> b name: '-').
			(z -> c name: 'd').
			(z -> d name: '.').
			(b -> c name: 'd').
			(c -> d name: '.').
			(c -> c name: 'd').
			(b -> d name: '.').
			(d -> k name: 'd').
			(k -> k name: 'd')}.

	isDigit := [ :aValue | '^[0-9]$' asRegex matches: aValue ].
	fsm transitions select: [ :each | each name = 'd' ] thenDo: [ :each | each matchBlock: isDigit ].

	OPWorkbench openProject: project