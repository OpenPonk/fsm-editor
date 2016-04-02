toolbar
toolbarMenu: aBuilder
	<dcEditorToolbarMenu: #DCFsmPlugin>
	(aBuilder item: 'Help')
		icon: Smalltalk ui icons help;
		action: [ HelpBrowser openOn: DCFsmHelp ]