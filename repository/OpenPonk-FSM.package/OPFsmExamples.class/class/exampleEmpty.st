examples
exampleEmpty
	| project fsm |
	project := OPProject new name: 'New StateMachine'.
	fsm := OPFsm new name: 'New StateMachine Diagram'.
	project addModel: fsm.
	OPWorkbench openProject: project