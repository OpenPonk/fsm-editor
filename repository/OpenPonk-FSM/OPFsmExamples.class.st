Class {
	#name : #OPFsmExamples,
	#superclass : #Object,
	#category : 'OpenPonk-FSM-Examples'
}

{ #category : #examples }
OPFsmExamples class >> exampleDecimal [
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
]

{ #category : #examples }
OPFsmExamples class >> exampleDivisibility [
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
]

{ #category : #examples }
OPFsmExamples class >> exampleEmpty [
	| project fsm |
	project := OPProject new name: 'New StateMachine'.
	fsm := OPFsm new name: 'New StateMachine Diagram'.
	project addModel: fsm.
	OPWorkbench openProject: project
]

{ #category : #menu }
OPFsmExamples class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: #OPFSM)
		label: 'Finite State Machine';
		icon: OPCoreIcons opFsmDiagramIcon;
		action: [ self exampleEmpty ];
		parent: #MostUsedTools;
		order: 220;
		with: [ 
			(aBuilder item: #'FSM Example')
				parent: #OPFSM;
				label: 'FSM Example Divisibility';
				icon: OPCoreIcons opFsmDiagramIcon;
				action: [ self exampleDivisibility ].
			(aBuilder item: #'FSM Example 2')
				parent: #OPFSM;
				label: 'FSM Example Decimal';
				icon: OPCoreIcons opFsmDiagramIcon;
				action: [ self exampleDecimal ] ]
]
