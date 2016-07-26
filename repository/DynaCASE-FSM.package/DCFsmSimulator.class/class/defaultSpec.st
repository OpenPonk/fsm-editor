specs
defaultSpec
	^ SpecColumnLayout composed
		newRow: [ :row | 
			row
				add: #inputLabel width: 50;
				add: #input;
				add: #separatorLabel width: 80;
				add: #separatorInput width: 60 ]
			height: 25;
		newRow: [ :row | 
			row
				add: #startButton;
				add: #stopButton;
				add: #resetButton ]
			height: self toolbarHeight;
		newRow: [ :row | row add: #letterPanel ] height: self toolbarHeight;
		newRow: [ :row | 
			row
				add: #backButton;
				add: #nextButton;
				add: #runButton;
				newColumn: [ :col |  ] ]
			height: self toolbarHeight;
		newRow: [ :row |  ];
		yourself