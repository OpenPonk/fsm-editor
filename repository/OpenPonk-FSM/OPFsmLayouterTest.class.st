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

	| stateController1 stateController2 transitionController canvasPresenter model stateModel1 stateModel2 transitionModel project |
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

	"Create a dummy project to break the circular initialization dependency"
	project := OPProject new.

	diagramController := OPFsmController new.
	canvasPresenter := OPCanvasPresenter new.
	canvasPresenter attachController: diagramController.
	diagramController diagramElement:
		(OPOpenPonkDiagram forModelElement: model).

	diagramController viewModelRegistry:
		(OPViewModelRegistry forProject: project).
	diagramController model: model.

	stateController1 viewModelRegistry:
		diagramController viewModelRegistry.
	stateController1 model: stateModel1.

	stateController2 viewModelRegistry:
		diagramController viewModelRegistry.
	stateController2 model: stateModel2.

	transitionController viewModelRegistry:
		diagramController viewModelRegistry.
	transitionController model: transitionModel.

	diagramController showAllElements
]

{ #category : 'tests' }
OPFsmLayouterTest >> testApplyLayout [

	^ OPFsmLayouter new
		  diagramController: diagramController;
		  applyLayout: [ :a :b |  ]
]
