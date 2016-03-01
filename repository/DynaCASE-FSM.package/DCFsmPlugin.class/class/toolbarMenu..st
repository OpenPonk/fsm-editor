toolbar
toolbarMenu: aBuilder
	(aBuilder item: 'Open Simulator')
		action: [ DCFsmSimulator new openOn: aBuilder model diagramController ].
	(aBuilder item: 'Help')
		icon: Smalltalk ui icons help;
		action: [ HelpBrowser openOn: DCFsmHelp ]