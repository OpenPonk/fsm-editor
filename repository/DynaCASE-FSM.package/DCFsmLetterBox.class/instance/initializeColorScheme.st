initialization
initializeColorScheme
	colors := {(#normal -> Smalltalk ui theme windowColor).
	(#processed -> Color paleOrange).
	(#failure -> Color paleRed).
	(#success -> Color paleGreen)} asDictionary.
	Smalltalk ui theme class = Pharo3DarkTheme
		ifTrue:
			[ colors := {(#normal -> Smalltalk ui theme windowColor).
			(#processed -> Color paleOrange muchDarker).
			(#failure -> Color paleRed muchDarker).
			(#success -> Color paleGreen muchDarker)} asDictionary ]