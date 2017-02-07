toolbar
canvasToolbarFor: aBuilder
	<dcCanvasToolbar: #OPFsmPlugin>
	(aBuilder item: 'Layout')
		action: [ OPLayoutWizard new
				controller: aBuilder model diagramController;
				open ]