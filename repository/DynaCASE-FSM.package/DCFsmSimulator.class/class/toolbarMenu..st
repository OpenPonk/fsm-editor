toolbar
toolbarMenu: aBuilder
	<dcEditorToolbarMenu: #DCFsmPlugin>
	(aBuilder item: 'Open Simulator')
		action: [ DCFsmSimulator new openOn: aBuilder model diagramController ]