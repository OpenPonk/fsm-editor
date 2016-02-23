tests
testTransitions
	| d first second t |
	d := DCFsm new.
	first := DCFsmState new name: '1'.
	second := DCFsmState new name: '2'.
	d add: first.
	d add: second.

	t := DCFsmTransition from: first to: second.

	self assert: first outgoing size = 0.
	self assert: second incoming size = 0.

	d add: t.
	self assert: first outgoing size = 1.
	self assert: first outgoing first = t.

	self assert: second incoming size = 1.
	self assert: second incoming first = t