accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				project: 'Mustache'
				with: [ spec
						className: #ConfigurationOfMustache;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/NorbertHartl/Mustache/main/' ].
			spec
				project: 'XMLParser'
				with: [ spec
						className: #ConfigurationOfXMLParser;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main/' ].
			spec
				project: 'XPath'
				with: [ spec
						className: #ConfigurationOfXPath;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/PharoExtras/XPath/main/' ].
			spec
				baseline: 'DynaCASE'
				with: [ spec repository: 'github://openponk/openponk/repository' ].
			spec
				package: 'DynaCASE-FSM'
				with: [ spec requires: #('DynaCASE' 'Mustache' 'XMLParser' 'XPath') ].
			spec package: 'DynaCASE-FSM' with: [ spec requires: #('DynaCASE') ].
			spec group: 'plugin' with: #('DynaCASE-FSM').
			spec group: 'default' with: #('plugin' 'DynaCASE') ]