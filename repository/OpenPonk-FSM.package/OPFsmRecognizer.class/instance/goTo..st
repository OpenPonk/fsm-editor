private
goTo: aPlace
	current ifNotNil: [ self announce: (OPFsmRecognizerLeave place: current) ].
	current := aPlace.
	self announce: (OPFsmRecognizerEnter place: current)