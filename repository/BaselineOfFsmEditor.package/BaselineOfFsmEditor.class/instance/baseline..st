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
				baseline: 'OpenPonk'
				with: [ spec repository: 'github://openponk/openponk:v0.1.0/repository' ].
			spec
				package: 'OpenPonk-FSM'
				with: [ spec requires: #('OpenPonk' 'Mustache' 'XMLParser' 'XPath') ].
			spec package: 'OpenPonk-FSM' with: [ spec requires: #('OpenPonk') ].
			spec group: 'plugin' with: #('OpenPonk-FSM').
			spec group: 'default' with: #('plugin' 'OpenPonk') ]