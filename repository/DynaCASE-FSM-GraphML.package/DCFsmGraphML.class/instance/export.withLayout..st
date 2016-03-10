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
							{(#uuid -> each uuid).
							(#name -> each name).
							(#graphmlType -> each graphmlType).
							(#position -> (aLayout at: each uuid ifAbsent: [ 0 @ 0 ]))} asDictionary ]))}
				asDictionary