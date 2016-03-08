export
export: aModel withLayout: aLayout
	^ (MustacheTemplate on: (self template copyReplaceAll: String cr with: String lf))
		value:
			{(#dateTime -> DateAndTime now truncated).
			(#model -> aModel).
			(#states
				->
					(aModel states
						collect: [ :each | 
							{(#dcID -> each dcID).
							(#name -> each name).
							(#graphmlType -> each graphmlType).
							(#position -> (aLayout at: each dcID ifAbsent: [ 0 @ 0 ]))} asDictionary ]))}
				asDictionary