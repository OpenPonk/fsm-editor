"
Verifies view model metadata, class mappings, children collections, dependent elements, and icons for finite-state machine view models.
"
Class {
	#name : 'OPFsmViewModelTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-FSM-Tests-ViewModels',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'ViewModels'
}

{ #category : 'tests' }
OPFsmViewModelTest >> testViewModelChildrenAndIcons [

	| fsm initialState regularState finalState transition fsmViewModel initialViewModel regularViewModel finalViewModel transitionViewModel |
	fsm := OPFsm named: 'Machine'.
	fsmViewModel := OPFsmViewModel new model: fsm.
	self assertEmpty: fsmViewModel childrenModels.
	self assert: fsmViewModel modelRootViewModel identicalTo: fsmViewModel.
	self assert: fsmViewModel icon bits equals: OPFsmIcons opFsmDiagramIcon bits.

	initialState := OPFsmInitialState named: 'start'.
	regularState := OPFsmState named: 'middle'.
	finalState := (OPFsmState named: 'end')
		              beFinal;
		              yourself.
	transition := (initialState => regularState)
		              name: 'go';
		              yourself.
	fsm addAll: {
			initialState.
			regularState.
			finalState.
			transition }.

	self assertCollection: fsmViewModel childrenModels hasSameElements: {
			initialState.
			regularState.
			finalState }.

	initialViewModel := OPFsmInitialStateViewModel new model: initialState.
	regularViewModel := OPFsmStateViewModel new model: regularState.
	finalViewModel := OPFsmStateViewModel new model: finalState.
	self assert: initialViewModel icon bits equals: OPFsmIcons opFsmInitialStateIcon bits.
	self assert: regularViewModel icon bits equals: OPFsmIcons opFsmRegularStateIcon bits.
	self assert: finalViewModel icon bits equals: OPFsmIcons opFsmFinalStateIcon bits.
	self assertCollection: initialViewModel childrenModels hasSameElements: { transition }.
	self assertCollection: initialViewModel dependentElements hasSameElements: { transition }.
	self assertCollection: regularViewModel dependentElements hasSameElements: { transition }.

	transitionViewModel := OPFsmTransitionViewModel new model: (OPFsmTransition new
			                        name: 'next';
			                        yourself).
	self assert: transitionViewModel icon bits equals: OPFsmIcons opFsmTransitionIcon bits.
	transitionViewModel attachModelFrom: regularViewModel to: finalViewModel.
	self assert: transitionViewModel model source identicalTo: regularState.
	self assert: transitionViewModel model target identicalTo: finalState
]

{ #category : 'tests' }
OPFsmViewModelTest >> testViewModelMetadataAndClassMappings [

	self assert: OPFsmVertexViewModel isAbstract description: 'Base vertex view model must report as abstract'.
	self deny: OPFsmStateViewModel isAbstract description: 'State view model must not report as abstract'.
	self deny: OPFsmInitialStateViewModel isAbstract description: 'Initial state view model must not report as abstract'.
	self deny: OPFsmViewModel isAbstract description: 'Diagram view model must not report as abstract'.
	self deny: OPFsmTransitionViewModel isAbstract description: 'Transition view model must not report as abstract'.

	self assert: OPFsmViewModel modelClass identicalTo: OPFsm.
	self assert: OPFsmViewModel commonModelClassPrefix equals: 'OPFsm'.
	self assert: OPFsmVertexViewModel modelClass identicalTo: OPFsmVertex.
	self assert: OPFsmStateViewModel modelClass identicalTo: OPFsmState.
	self assert: OPFsmInitialStateViewModel modelClass identicalTo: OPFsmInitialState.
	self assert: OPFsmTransitionViewModel modelClass identicalTo: OPFsmTransition
]
