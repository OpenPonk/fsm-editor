*DynaCASE-FSM-GraphML
graphmlType
	self isFinal
		ifTrue: [ ^ #final ]
		ifFalse: [ ^ #regular ]