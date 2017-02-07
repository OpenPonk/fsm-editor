initialization
initialize
	super initialize.
	matchBlock := [ :aValue | (self name splitOn: ',') includes: aValue asString ]