"
Manifest for the OpenPonk FSM package. Contains metadata and settings for the FSM plugin and its critic rules.
"
Class {
	#name : 'ManifestOpenPonkFSM',
	#superclass : 'PackageManifest',
	#category : 'OpenPonk-FSM-Manifest',
	#package : 'OpenPonk-FSM',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestOpenPonkFSM class >> ruleReShouldSendSuperInitializeAsFirstMessageV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#OPFsmSimulator #initialize #false)) #'2026-08-30T22:36:45.436+02:00') )
]
