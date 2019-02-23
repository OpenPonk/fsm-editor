testing
canBeSourceFor: aController
	^ (aController respondsTo: #modelClass)
		and: [ aController modelClass = OPFsmTransition ]