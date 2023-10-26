Class {
	#name : #OPFsmStateControllerTest,
	#superclass : #OPFsmVertexControllerTest,
	#category : #'OpenPonk-FSM-Tests'
}

{ #category : #accessing }
OPFsmStateControllerTest >> controllerClass [
	^ OPFsmStateController
]

{ #category : #construction }
OPFsmStateControllerTest >> diagramElementClass [

	^ OPFsmStateShape
]

{ #category : #accessing }
OPFsmStateControllerTest >> modelClass [
	^ OPFsmState
]

{ #category : #tests }
OPFsmStateControllerTest >> testCreateFigure [

	controller createModelIn: diagramController model.
	diagramController addController: controller.
	self assert: diagramController canvas nodes isEmpty.
	controller
		createDiagramElement;
		renderDiagramElement.
	self assert: diagramController canvas nodes isNotEmpty.
	self assert: controller diagramElement class equals: OPFsmStateShape.
	self assert: (controller roassalShape isKindOf: RSCircularShape).
	self assert: controller roassalShape color equals: Color white.
	self assert: controller roassalShape extent >= (50 @ 50)
]

{ #category : #tests }
OPFsmStateControllerTest >> testFigureRefresh [

	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller
		createDiagramElement;
		renderDiagramElement.
	self assert: controller diagramElement modelElement name equals: ''.
	controller model name: 'new name'.
	controller diagramElement modelChanged.
	self assert:
		(controller diagramElement canvas nodes anySatisfy: [ :any | 
			 (any isKindOf: RSLabel) and: [ any text = 'new name' ] ])
]
