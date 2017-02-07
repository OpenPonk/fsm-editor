userinterface
applyDefaultLayout
	self
		applyLayout:
			(RTHorizontalTreeLayout new
				horizontalGap: 50;
				verticalGap: 50;
				doNotAttachPoint;
				yourself)