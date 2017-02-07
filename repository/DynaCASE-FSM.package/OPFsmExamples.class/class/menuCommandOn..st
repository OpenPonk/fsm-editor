menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'DC Finite State Machine')
		icon: OPIcons current dcFsmDiagramIcon;
		parent: #MostUsedTools;
		action: [ self exampleEmpty ];
		with: [ 
					(aBuilder item: #'FSM Example')
						parent: #'DC Finite State Machine';
						label: 'FSM Example Divisibility';
						icon: OPIcons current dcFsmDiagramIcon;
						action: [ self exampleDivisibility ].

					(aBuilder item: #'FSM Example 2')
						parent: #'DC Finite State Machine';
						label: 'FSM Example Decimal';
						icon: OPIcons current dcFsmDiagramIcon;
						action: [ self exampleDecimal ] ]