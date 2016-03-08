figures
createEdgeFrom: fromElement to: toElement
	^ DCRTCallbackBuilder
		block: [ :view | 
			fromElement = toElement
				ifTrue: [ self createSelfEdgeFor: fromElement inView: view ]
				ifFalse: [ self createEdgeFrom: fromElement to: toElement inView: view ] ]