toolbar
toolbarMenu: aBuilder
	<dcEditorToolbarMenu: #OPFsmPlugin>
	(aBuilder item: 'Open Simulator')
		action: [ OPFsmSimulator new openOn: aBuilder model diagramController ]