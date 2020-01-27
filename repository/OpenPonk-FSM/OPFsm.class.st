"
A DCFsm is the class representing FSM diagram.

"
Class {
	#name : #OPFsm,
	#superclass : #OPModelObject,
	#category : #'OpenPonk-FSM-Models'
}

{ #category : #testing }
OPFsm >> isState [
	^ false
]

{ #category : #testing }
OPFsm >> isTransition [
	^ false
]

{ #category : #accessing }
OPFsm >> states [
	^ elements select: [ :each | each isState ]
]

{ #category : #accessing }
OPFsm >> transitions [
	^ elements select: [ :each | each isTransition ]
]
