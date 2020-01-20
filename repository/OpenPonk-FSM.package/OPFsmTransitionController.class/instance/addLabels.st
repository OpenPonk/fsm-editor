rendering
addLabels
	self source = self target
		ifTrue: [ self constraintSelfEdgeLabel: #name ]
		ifFalse: [ self constraintLabel: #name balance: 0.2 offset: 12 ].
	figure
		when: TRMouseDoubleLeftClick
		do: [ :evt | OPRenameElementCommand executeOn: self model ].
	(figure labels at: #name)
		when: TRMouseDoubleLeftClick
		do: [ :evt | OPRenameElementCommand executeOn: self model ]