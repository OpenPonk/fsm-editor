stepping
input: aCollection startingAt: aState
	self reset.
	aCollection reverseDo: [ :each | input push: each ].
	self goTo: aState outgoing anyOne target	"skip the initial state"