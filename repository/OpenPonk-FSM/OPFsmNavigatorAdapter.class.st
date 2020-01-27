"
I implement specific mappings for FSM.

!! Collaborators

DCNavigator
"
Class {
	#name : #OPFsmNavigatorAdapter,
	#superclass : #OPNavigatorAdapter,
	#category : #'OpenPonk-FSM-Adapters'
}

{ #category : #'widget API' }
OPFsmNavigatorAdapter >> childrenMapping [
	^ {(OPFsm -> #states).
	(OPFsmVertex -> #outgoing).
	(OPFsmIncomingTransition -> #()).
	(OPFsmTransition -> #())}
]

{ #category : #accessing }
OPFsmNavigatorAdapter >> contextMenuMapping [
	^ {}
]

{ #category : #'widget API' }
OPFsmNavigatorAdapter >> dependentMapping [
	^ {(OPFsm -> #states).
	(OPFsmVertex
		-> [ :o | 
			o outgoing
				,
					(o incoming
						collect: [ :each | OPFsmIncomingTransition ofTransition: each ]) ]).
	(OPFsmTransition -> #())}
]

{ #category : #'widget API' }
OPFsmNavigatorAdapter >> displayMapping [
	^ {(OPFsm -> 'Diagram').
	(OPFsmInitialState -> 'Initial State').
	(OPFsmState
		-> [ :o | 
			o isNormal
				ifTrue: [ 'State' ]
				ifFalse: [ 'Final State' ] ]).
	(OPFsmTransition -> 'Transition').
	(OPFsmIncomingTransition -> 'Incoming transition')}
]

{ #category : #testing }
OPFsmNavigatorAdapter >> hasMappingFor: anObject [
	^ {OPFsm.
	OPFsmTransition.
	OPFsmIncomingTransition.
	OPFsmVertex} anySatisfy: [ :any | anObject isKindOf: any ]
]

{ #category : #'widget API' }
OPFsmNavigatorAdapter >> iconMapping [
	^ {(OPFsm -> OPIcons current dcFsmDiagramIcon).
	(OPFsmInitialState -> OPIcons current dcFsmInitialStateIcon).
	(OPFsmIncomingTransition
		-> OPIcons current dcFsmFlippedTransitionIcon).
	(OPFsmTransition -> OPIcons current dcFsmTransitionIcon).
	(OPFsmState
		-> [ :o | 
			o isNormal
				ifTrue: [ OPIcons current dcFsmRegularStateIcon ]
				ifFalse: [ OPIcons current dcFsmFinalStateIcon ] ])}
]
