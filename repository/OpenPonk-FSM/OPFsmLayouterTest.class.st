"
Unit tests for OPFsmLayouter.
Verifies the correct application of automated layouts to FSM diagrams.
"
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
	| stateController1 stateController2 transitionController canvasPresenter model stateModel1 stateModel2 transitionModel project projectController |
	super setUp.

	stateController1 := OPFsmStateController new.
	stateController2 := OPFsmStateController new.
	transitionController := OPFsmTransitionController new.

	model := OPFsm new.
	stateModel1 := OPFsmState new.
	stateModel2 := OPFsmState new.
	transitionModel := OPFsmTransition from: stateModel1 to: stateModel2.
	model
		add: stateModel1;
		add: stateModel2;
		add: transitionModel.

	project := OPProject new.
	project addModel: model.
	projectController := OPProjectController forProject: project.

	diagramController := OPFsmController new.
	projectController addDiagramController: diagramController.
	canvasPresenter := OPCanvasPresenter new.
	canvasPresenter attachController: diagramController.
	diagramController diagramElement:
		(OPOpenPonkDiagram forModelElement: model).
	diagramController model: model.

	stateController1 diagramController: diagramController.
	stateController1 model: stateModel1.

	stateController2 diagramController: diagramController.
	stateController2 model: stateModel2.

	transitionController diagramController: diagramController.
	transitionController model: transitionModel.

	diagramController showAllElements
]

{ #category : 'tests' }
OPFsmLayouterTest >> testApplyLayout [

	^ OPFsmLayouter new
		  diagramController: diagramController;
		  applyLayout: [ :a :b |  ]
]
