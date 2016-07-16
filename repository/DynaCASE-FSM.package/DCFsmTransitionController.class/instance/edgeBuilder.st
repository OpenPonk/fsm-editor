figures
edgeBuilder
	^ DCRTEdgeBuilder new
		arrowHead;
		attachPoint: (RTBorderAttachPoint new offset: -10);
		constraintLabel: #name balance: 0.2 offset: 12;
		yourself