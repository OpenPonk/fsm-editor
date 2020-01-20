figures
createEdgeFrom: fromElement to: toElement
	^ OPRTStyledMultiLine new
		color: Color black;
		arrowHead;
		attachPoint: (RTBorderAttachPoint new offset: -10);
		edgeFrom: fromElement to: toElement