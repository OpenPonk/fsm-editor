Class {
	#name : 'BaselineOfOpenPonkFsmEditor',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOpenPonkFsmEditor',
	#package : 'BaselineOfOpenPonkFsmEditor'
}

{ #category : 'baselines' }
BaselineOfOpenPonkFsmEditor >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Mustache'
			with: [ spec repository: 'github://noha/mustache:a8db6a2' ].
		spec
			baseline: 'OpenPonk'
			with: [ spec repository: 'github://openponk/openponk' ].
		spec
			baseline: 'OpenPonkModel'
			with: [ spec repository: 'github://OpenPonk/openponk-model' ].
		spec
			package: 'OpenPonk-FSM'
			with: [
			spec requires: #( 'OpenPonkModel' 'Mustache' ) ].
		spec group: 'plugin' with: #( 'OpenPonk-FSM' ).
		spec group: 'default' with: #( 'OpenPonk' 'plugin' ) ]
]
