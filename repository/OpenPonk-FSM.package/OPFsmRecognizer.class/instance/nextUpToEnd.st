stepping
nextUpToEnd
	[ canContinue ]
		whileTrue: [ self next.
			0 second asDelay wait.
			World doOneCycle ]