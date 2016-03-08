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
				baseline: 'DynaCASE'
				with: [ spec repository: 'github://dynacase/dynacase/repository' ].
			spec
				package: 'DynaCASE-FSM-GraphML'
				with: [ spec requires: #('DynaCASE' 'Mustache' 'XMLParser') ].
			spec
				package: 'DynaCASE-FSM'
				with: [ spec requires: #('DynaCASE' 'DynaCASE-FSM-GraphML') ].
			spec group: 'plugin' with: #('DynaCASE-FSM').
			spec group: 'default' with: #('plugin' 'DynaCASE') ]