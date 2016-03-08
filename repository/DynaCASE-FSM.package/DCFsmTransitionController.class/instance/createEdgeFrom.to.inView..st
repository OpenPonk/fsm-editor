figures
createEdgeFrom: fromElement to: toElement inView: aView
	| e |
	e := self edgeBuilder createFigureFrom: fromElement to: toElement view: aView.
	e when: TRMouseDoubleLeftClick do: [ :evt | DCRenameElementCommand executeOn: self model ].
	(e labels at: #name)
		when: TRMouseDoubleLeftClick
		do: [ :evt | DCRenameElementCommand executeOn: self model ].
	^ e