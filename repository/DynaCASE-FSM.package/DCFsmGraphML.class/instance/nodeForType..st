import
nodeForType: aType
	aType = #initial
		ifTrue: [ ^ DCFsmInitialState new ].
	aType = #final
		ifTrue: [ ^ DCFsmState new
				beFinal;
				yourself ].
	^ DCFsmState new