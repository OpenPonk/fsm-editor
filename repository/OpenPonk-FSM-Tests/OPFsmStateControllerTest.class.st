"
Unit tests for OPFsmStateController.
Verifies rendering logic and diagram lifecycle for standard states.
"
Class {
	#name : 'OPFsmStateControllerTest',
	#superclass : 'OPFsmVertexControllerTest',
	#category : 'OpenPonk-FSM-Tests-Controllers',
	#package : 'OpenPonk-FSM-Tests',
	#tag : 'Controllers'
}

{ #category : 'constants' }
OPFsmStateControllerTest class >> diagramElementClass [

	^ OPFsmStateShape
]

{ #category : 'constants' }
OPFsmStateControllerTest >> controllerClass [
	^ OPFsmStateController
]

{ #category : 'constants' }
OPFsmStateControllerTest >> modelClass [
	^ OPFsmState
]

{ #category : 'tests' }
OPFsmStateControllerTest >> testCreateUsingAddAsTarget [

	super testCreateUsingAddAsTarget.
	self assert: controller roassalShape class identicalTo: RSCircle.
	self assert: controller roassalShape color equals: Color white.
	self assert: controller roassalShape extent equals: 61.5 @ 61.5
]

{ #category : 'tests' }
OPFsmStateControllerTest >> testFigureRefresh [

	| labelShapes |
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller
		createDiagramElement;
		renderDiagramElement.
	self assert: controller diagramElement modelElement name equals: ''.
	controller model name: 'new name'.
	controller modelChanged.
	labelShapes := controller diagramElement canvas allChildren select: [ :each | each class == RSLabel ].
	self assert: (labelShapes collect: #text as: Array) equals: #( 'new name' )
]

{ #category : 'tests' }
OPFsmStateControllerTest >> testUpdateLabelWithNilAndMultilineName [

	| labelShapes |
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller
		createDiagramElement;
		renderDiagramElement.

	controller model name: nil.
	controller modelChanged.
	labelShapes := controller diagramElement canvas allChildren select: [ :each | each class == RSLabel ].
	self assert: (labelShapes collect: #text as: Array) equals: #( '' ).

	controller model name: (String cr join: #( 'Line 1' 'Line 2' )).
	controller modelChanged.
	labelShapes := controller diagramElement canvas allChildren select: [ :each | each class == RSLabel ].
	self assert: (labelShapes collect: #text as: Array) equals: #( 'Line 1' 'Line 2' )
]

{ #category : 'tests' }
OPFsmStateControllerTest >> testVertexAdornmentsAndUnhookDiagramElement [

	| mockWorkbench editor palette targetController selectable adornmentBoxes nodeTool builder |
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller
		createDiagramElement;
		renderDiagramElement.

	targetController := OPFsmStateController new.
	targetController diagramController: diagramController.
	targetController createModelIn: diagramController model.
	diagramController addController: targetController.
	targetController
		createDiagramElement;
		renderDiagramElement.

	mockWorkbench := Mock new.
	(mockWorkbench stub openFormOn: Any) willReturn: nil.
	mockWorkbench stub projectController willReturn: diagramController projectController.
	editor := (OPEditor on: OPFsmPlugin new)
		          workbench: mockWorkbench;
		          yourself.
	palette := editor palette.
	diagramController editor: editor.
	palette createPaletteFor: diagramController.

	selectable := controller roassalShape propertyAt: OPRSSelectable.
	selectable fakeClicked: controller roassalShape.
	adornmentBoxes := diagramController canvas shapes select: [ :eachShape |
		                  eachShape class == RSBox and: [ eachShape model == controller roassalShape ] ].
	self assert: adornmentBoxes size equals: 2.

	adornmentBoxes second announce: RSMouseLeftClick new.
	self assert: palette selectedTool class identicalTo: OPConnectionCreationTool.
	palette selectedTool selectedControllers: { targetController }.
	self assert: diagramController model transitions size equals: 1.
	self assert: diagramController model transitions anyOne source identicalTo: controller model.
	self assert: diagramController model transitions anyOne target identicalTo: targetController model.

	adornmentBoxes first announce: RSMouseLeftClick new.
	nodeTool := palette selectedTool.
	self assert: nodeTool class identicalTo: OPNodeCreationTool.
	nodeTool selectedControllers: { diagramController }.
	self assert: diagramController model states size equals: 3.
	self assert: diagramController model transitions size equals: 2.
	self assert: palette selectedTool class identicalTo: OPSelectionTool.

	controller unhookDiagramElement.
	builder := OPRSAdornmentBuilder new.
	(controller diagramElement instVarNamed: #adornmentCreationBlock) value: builder.
	self assertEmpty: (builder instVarNamed: #adornments).

	controller diagramElement: OPNoShape instance.
	controller unhookDiagramElement.
	self deny: controller diagramElement exists description: 'Unhooking with OPNoShape must leave diagramElement non-existent'
]
