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

{ #category : #accessing }
OPFsmNavigatorAdapter class >> priority [

	^ 10
]

{ #category : #'widget API' }
OPFsmNavigatorAdapter >> childrenMapping [
	^ {(OPFsm -> #states).
	(OPFsmVertex
		-> [ :o | 
			o outgoing
				, (o incoming collect: [ :each | OPFsmIncomingTransition of: each ]) ]).
	(OPFsmIncomingTransition -> #()).
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
	^ {(OPFsm -> OPCoreIcons opFsmDiagramIcon).
	(OPFsmInitialState -> OPCoreIcons opFsmInitialStateIcon).
	(OPFsmIncomingTransition
		-> OPCoreIcons opFsmFlippedTransitionIcon).
	(OPFsmTransition -> OPCoreIcons opFsmTransitionIcon).
	(OPFsmState
		-> [ :o | 
			o isNormal
				ifTrue: [ OPCoreIcons opFsmRegularStateIcon ]
				ifFalse: [ OPCoreIcons opFsmFinalStateIcon ] ])}
]

{ #category : #private }
OPFsmNavigatorAdapter >> sort: modelObjects [
	^ modelObjects
		sorted:
			[ :a :b | a name isNotNil and: [ b name isNil or: [ a name < b name ] ] ]
]

{ #category : #'widget API' }
OPFsmNavigatorAdapter >> typesByDependency [
	^ {OPFsm.
	OPFsmVertex.
	OPFsmTransition.
	OPFsmIncomingTransition}
]
