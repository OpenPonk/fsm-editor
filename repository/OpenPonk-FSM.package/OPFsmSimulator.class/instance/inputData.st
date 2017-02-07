accessing - spec fields
inputData
	"^self input text"

	^ self separatorInput text
		ifEmpty: [ self input text trim asArray collect: #asString ]
		ifNotEmpty: [ :sep | ^ ((self input text splitOn: sep) collect: #trim) removeAllSuchThat: #isEmpty ]