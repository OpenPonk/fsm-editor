*DynaCASE-FSM-GraphML-accessing
graphmlType
	self isFinal
		ifTrue: [ ^ #final ]
		ifFalse: [ ^ #regular ]