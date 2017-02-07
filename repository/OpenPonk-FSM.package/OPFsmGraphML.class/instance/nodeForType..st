import
nodeForType: aType
	aType = #initial
		ifTrue: [ ^ OPFsmInitialState new ].
	aType = #final
		ifTrue: [ ^ OPFsmState new
				beFinal;
				yourself ].
	^ OPFsmState new