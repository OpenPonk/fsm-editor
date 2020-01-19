toolbar
canvasToolbarFor: aBuilder
	<opCanvasToolbar: #OPFsmPlugin>
	(aBuilder item: 'Layout')
		action: [ OPLayoutWizard new
				controller: aBuilder model diagramController;
				open ]