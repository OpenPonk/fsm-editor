Class {
	#name : #BaselineOfFsmEditor,
	#superclass : #BaselineOf,
	#category : #BaselineOfFsmEditor
}

{ #category : #accessing }
BaselineOfFsmEditor >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Mustache'
				with: [ spec repository: 'github://noha/mustache:v1.1' ].
			spec
				baseline: 'XMLParser'
				with: [ spec
						repository: 'github://pharo-contributions/XML-XMLParser:3.5.x/src';
						loads: #(Core) ].
			spec
				baseline: 'XPath'
				with: [ spec
						repository: 'github://pharo-contributions/XML-XPath:3450f91/src';
						loads: #(Core) ].
			spec
				baseline: 'OpenPonk'
				with: [ spec repository: 'github://openponk/openponk:dev/Roassal3' ].
			spec
				baseline: 'OpenPonkModel'
				with: [ spec repository: 'github://OpenPonk/openponk-model/repository' ].
			spec
				package: 'OpenPonk-FSM'
				with: [ spec requires: #('OpenPonkModel' 'Mustache' 'XMLParser' 'XPath') ].
			spec group: 'plugin' with: #('OpenPonk-FSM').
			spec group: 'default' with: #('OpenPonk' 'plugin') ]
]
