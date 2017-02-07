export
export: aModel
	^ (MustacheTemplate on: self template)
		value:
			{(#dateTime -> DateAndTime now truncated).
			(#model -> aModel).
			(#states
				->
					(aModel states
						collect: [ :each | 
							Dictionary
								with: #uuid -> each uuid
								with: #name -> each name
								with: #graphmlType -> each graphmlType ]))} asDictionary