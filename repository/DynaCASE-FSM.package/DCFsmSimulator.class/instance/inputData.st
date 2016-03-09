accessing - spec fields
inputData
	"^self input text"

	^ ((self input text splitOn: ',') collect: #trim) removeAllSuchThat: #isEmpty