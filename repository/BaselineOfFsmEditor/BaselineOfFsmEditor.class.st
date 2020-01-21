Class {
	#name : #BaselineOfFsmEditor,
	#superclass : #BaselineOf,
	#category : 'BaselineOfFsmEditor'
}

{ #category : #accessing }
BaselineOfFsmEditor >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Mustache'
				with: [ spec repository: 'github://noha/mustache/repository' ].
			spec
				baseline: 'XMLParser'
				with: [ spec repository: 'github://pharo-contributions/XML-XMLParser:3.5.x/src' ].
			spec
				baseline: 'XPath'
				with: [ spec repository: 'github://pharo-contributions/XML-XPath:2.2.0/src' ].
			spec
				baseline: 'OpenPonk'
				with: [ spec repository: 'github://openponk/openponk/repository' ]. 
			spec
				baseline: 'OpenPonkModel'
				with: [ spec repository: 'github://OpenPonk/openponk-model/repository' ].
			spec
				package: 'OpenPonk-FSM'
				with: [ spec requires: #('OpenPonk' 'OpenPonkModel' 'Mustache' 'XMLParser' 'XPath') ].
			spec group: 'default' with: #('OpenPonk-FSM') ]

]
