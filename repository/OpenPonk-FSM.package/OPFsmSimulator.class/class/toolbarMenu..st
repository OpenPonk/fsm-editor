toolbar
toolbarMenu: aBuilder
	<opEditorToolbarMenu: #OPFsmPlugin>
	(aBuilder item: 'Open Simulator')
		action: [ OPFsmSimulator new openOn: aBuilder model diagramController ]