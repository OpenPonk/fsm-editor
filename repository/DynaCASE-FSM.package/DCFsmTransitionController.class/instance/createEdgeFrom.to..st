figures
createEdgeFrom: fromElement to: toElement
	fromElement = toElement
		ifTrue:
			[ ^ DCRTCallbackBuilder
				block: [ :view | self createEdgeFor: fromElement inView: view ] ]
		ifFalse:
			[ ^ DCRTCallbackBuilder
				block:
					[ :view | 
					| e |
					e := self edgeBuilder createFigureFrom: fromElement to: toElement view: view.
					e
						when: TRMouseDoubleLeftClick
						do: [ :evt | DCRenameElementCommand executeOn: self model ].
					(e labels at: #name)
						when: TRMouseDoubleLeftClick
						do: [ :evt | DCRenameElementCommand executeOn: self model ].
					e ] ]