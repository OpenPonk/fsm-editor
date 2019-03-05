hooks
edgeBuilder
	| builder |
	builder := OPRTEdgeBuilder new
		arrowHead;
		attachPoint: (RTBorderAttachPoint new offset: -10);
		yourself.
	source = target
		ifTrue: [ builder constraintSelfEdgeLabel: #name ]
		ifFalse: [ builder constraintLabel: #name balance: 0.2 offset: 12 ].
	^ builder