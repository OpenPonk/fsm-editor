toolbar
toolbarMenu: aBuilder
	<dcEditorToolbarMenu: #OPFsmPlugin>
	(aBuilder item: 'Help')
		icon: Smalltalk ui icons help;
		action: [ HelpBrowser openOn: OPFsmHelp ]