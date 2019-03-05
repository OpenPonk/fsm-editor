accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Mustache'
				with: [ spec repository: 'github://noha/mustache/repository' ].
			spec
				project: 'XMLParser'
				with: [ spec
						className: #ConfigurationOfXMLParser;
						versionString: #stable;
						loads: #(CoreWithWriting);
						repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main/' ].
			spec
				project: 'XPath'
				with: [ spec
						className: #ConfigurationOfXPath;
						versionString: #stable;
						loads: #(CoreWithWriting);
						repository: 'http://smalltalkhub.com/mc/PharoExtras/XPath/main/' ].
			spec
				baseline: 'OpenPonk'
				with: [ spec repository: 'github://openponk/openponk:v1.0.0/repository' ]. 
			spec
				baseline: 'OpenPonkModel'
				with: [ spec repository: 'github://JanBliznicenko/openponk-model/repository' ].
			spec
				package: 'OpenPonk-FSM'
				with: [ spec requires: #('OpenPonk' 'OpenPonkModel' 'Mustache' 'XMLParser' 'XPath') ].
			spec group: 'default' with: #('OpenPonk-FSM') ]