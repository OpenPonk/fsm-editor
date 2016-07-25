toolbar
canvasToolbarFor: aBuilder
	<dcCanvasToolbar: #DCFsmPlugin>
	(aBuilder item: 'Layout')
		action: [ DCLayoutWizard new
				controller: aBuilder model diagramController;
				open ]