"
I implement specific mappings for FSM.

!! Collaborators

DCNavigator
"
Class {
	#name : #OPFsmNavigatorAdapter,
	#superclass : #OPNavigatorAdapter,
	#category : 'OpenPonk-FSM-Adapters'
}

{ #category : #'widget API' }
OPFsmNavigatorAdapter >> childrenMapping [
	^ {
	OPFsm -> #states.
	OPFsmVertex -> #outgoing.
	OPFsmTransition -> #().
	}
]

{ #category : #accessing }
OPFsmNavigatorAdapter >> contextMenuMapping [
	^ {}
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
	(OPFsmTransition -> 'Transition')}
]

{ #category : #'widget API' }
OPFsmNavigatorAdapter >> iconMapping [
	^ {(OPFsm -> OPIcons current dcFsmDiagramIcon).
	(OPFsmInitialState -> OPIcons current dcFsmInitialStateIcon).
	(OPFsmTransition -> OPIcons current dcFsmTransitionIcon).
	(OPFsmState
		-> [ :o | 
			o isNormal
				ifTrue: [ OPIcons current dcFsmRegularStateIcon ]
				ifFalse: [ OPIcons current dcFsmFinalStateIcon ] ])}
]
