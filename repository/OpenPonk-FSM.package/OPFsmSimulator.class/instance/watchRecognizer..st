events
watchRecognizer: aRecognizer
	aRecognizer
		when: OPFsmRecognizerEvent
		do: [ :ann | 
			aRecognizer isInputEmpty
				ifFalse: [ nextButton enable.
					runButton enable ].
			aRecognizer isPathEmpty
				ifFalse: [ backButton enable ].
			(ann isKindOf: OPFsmRecognizerFailure) not & ann place isState
				ifTrue: [ self letterPanel widget changeBoxAt: aRecognizer inputPosition - 1 to: #beSuccess ].
			ann place isTransition
				ifTrue: [ self letterPanel widget changeBoxAt: aRecognizer inputPosition - 1 to: #beProcessed ] ].
	aRecognizer
		when: OPFsmRecognizerSuccess
		do: [ :ann | 
			OPFsmFigureHighlighter
				highlightElement: (diagramController figureFor: ann place)
				with: Color green ].
	aRecognizer
		when: OPFsmRecognizerFailure
		do: [ :ann | 
			OPFsmFigureHighlighter
				highlightElement: (diagramController figureFor: ann place)
				with: Color red.
			self letterPanel widget changeBoxAt: aRecognizer inputPosition - 1 to: #beFailure ].
	aRecognizer
		when: OPFsmRecognizerLeave
		do: [ :ann | OPFsmFigureHighlighter unhighlight: (diagramController figureFor: ann place) ].
	aRecognizer
		when: OPFsmRecognizerEnter
		do: [ :ann | 
			OPFsmFigureHighlighter
				highlight: (diagramController figureFor: ann place)
				with: Color orange ]