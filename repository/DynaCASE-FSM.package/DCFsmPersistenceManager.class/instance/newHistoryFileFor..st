instance creation
newHistoryFileFor: aUUID
	(self historyPath / aUUID asString) ensureCreateDirectory.
	^ self historyPath / aUUID asString
		/ ('history-' , DateAndTime now asFileNameCompatibleString , 'graphml')