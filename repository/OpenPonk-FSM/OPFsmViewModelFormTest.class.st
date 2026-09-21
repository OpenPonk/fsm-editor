Class {
	#name : 'OPFsmViewModelFormTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'tests' }
OPFsmViewModelFormTest >> testStateViewModelBindsNameAndFinal [

	| form viewModel model |
	model := OPFsmState new
		         name: 'S1';
		         isFinal: true;
		         yourself.
	viewModel := OPFsmStateViewModel new model: model.
	form := OPPropertiesForm new.
	viewModel buildEditorForm: form.
	self assert: (form bindings anySatisfy: [ :each | each selector = #name ]).
	self assert: (form bindings anySatisfy: [ :each | each selector = #isFinal ])
]
