Class {
	#name : 'OPFsmLayouterTest',
	#superclass : 'TestCase',
	#instVars : [
		'diagramController'
	],
	#category : 'OpenPonk-FSM-Tests',
	#package : 'OpenPonk-FSM',
	#tag : 'Tests'
}

{ #category : 'running' }
OPFsmLayouterTest >> setUp [

	| stateController1 stateController2 transitionController canvasPresenter model stateModel1 stateModel2 transitionModel |
	diagramController := OPFsmController new.
	stateController1 := OPFsmStateController new.
	stateController2 := OPFsmStateController new.
	transitionController := OPFsmTransitionController new.

	canvasPresenter := OPCanvasPresenter new.
	canvasPresenter attachController: diagramController.

	model := OPFsm new.
	stateModel1 := OPFsmState new.
	stateModel2 := OPFsmState new.
	transitionModel := OPFsmTransition from: stateModel1 to: stateModel2.
	model
		add: stateModel1;
		add: stateModel2;
		add: transitionModel.

	diagramController model: model.
	stateController1 model: stateModel1.
	stateController2 model: stateModel2.
	transitionController model: transitionModel.

	diagramController showAllElements
]

{ #category : 'tests' }
OPFsmLayouterTest >> testBasicApplyLayout [

	^ OPFsmLayouter new
		  diagramController: diagramController;
		  basicApplyLayout: [ :a :b |  ]
]
