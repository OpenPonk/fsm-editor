"
An abstract base class for Commander 1 model commands executed within an FSM diagram editor.
"
Class {
	#name : 'OPFsmCommand',
	#superclass : 'OPModelCommand',
	#category : 'OpenPonk-FSM-Simulations',
	#package : 'OpenPonk-FSM',
	#tag : 'Simulations'
}

{ #category : 'testing' }
OPFsmCommand class >> canBeExecutedInEditor: anEditor [
	"Answers true if the active editor plugin is FSM."
	^ anEditor plugin isKindOf: OPFsmPlugin
]

{ #category : 'testing' }
OPFsmCommand class >> isAbstract [
	"Answers true if this class is the abstract root of FSM model commands."
	^ self = OPFsmCommand
]
