construction
showInDiagram: aDiagramController
	source ifNil: [ self source: (aDiagramController controllerForModel: model source) ].
	target ifNil: [ self target: (aDiagramController controllerForModel: model target) ].
	^ super showInDiagram: aDiagramController