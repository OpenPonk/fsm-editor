"
A DCFsmVertexController is a controller for a vertex in FSM.

"
Class {
	#name : 'OPFsmVertexController',
	#superclass : 'OPElementController',
	#category : 'OpenPonk-FSM-Controllers',
	#package : 'OpenPonk-FSM',
	#tag : 'Controllers'
}

{ #category : 'testing' }
OPFsmVertexController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and: [ aController modelClass = OPFsmTransition ]
]

{ #category : 'testing' }
OPFsmVertexController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : 'figures' }
OPFsmVertexController >> createTransitionAdornmentBy: builder [

	builder
		addIconShape: (RSSVGPath new
				 color: Color black;
				 svgPath: 'M-6.3,7 L4,-3.3 L4,2 L7,-7 L-2,-4 L3.3,-4 L-7,6.3 z';
				 size: 14;
				 yourself)
		action: [ 
			| tool |
			(tool := OPConnectionCreationTool new)
				palette: self diagramController editor palette;
				factory: [ OPFsmTransitionController new ].
			self diagramController editor palette selectTool: tool.
			tool selectedControllers: { self } ]
]

{ #category : 'figures' }
OPFsmVertexController >> createVertexAdornmentBy: builder [

	builder
		addIconShape: (RSCircle new
				 color: Color transparent;
				 borderColor: Color black;
				 size: 14;
				 yourself)
		action: [ 
			| tool |
			(tool := OPCreationTool new)
				palette: self diagramController editor palette;
				factory: [ OPFsmStateController new ];
				whenCreated: [ :ctrl | 
					| t2 |
					t2 := OPConnectionCreationTool new
						      palette: self diagramController editor palette;
						      factory: [ OPFsmTransitionController new ].
					self diagramController editor palette selectTool: t2.
					t2
						selectedControllers: { self };
						selectedControllers: { ctrl }.
					self diagramController editor palette selectedTool 
						selectedControllers: { ctrl } ].
			self diagramController editor palette selectTool: tool ]
]

{ #category : 'accessing' }
OPFsmVertexController >> dependentElements [
	^ (model incoming , model outgoing) asSet
]

{ #category : 'figures' }
OPFsmVertexController >> hookDiagramElement [

	super hookDiagramElement.
	
	self diagramElement adornmentCreationBlock: [ :builder | 
		self
			createVertexAdornmentBy: builder;
			createTransitionAdornmentBy: builder ]
]

{ #category : 'announcements' }
OPFsmVertexController >> internalSubscribeTo: aModel [

	super internalSubscribeTo: aModel.
	aModel weakWhen: OPElementRemoved send: #removeControllerAndDiagramElement to: self
]

{ #category : 'testing' }
OPFsmVertexController >> isHideable [
	^ true
]

{ #category : 'destruction' }
OPFsmVertexController >> removeModel [

	self diagramController model remove: self model.
	super removeModel
]

{ #category : 'figures' }
OPFsmVertexController >> unhookDiagramElement [

	super unhookDiagramElement.

	(self diagramElement ifNotExists: [ ^ self ])
		adornmentCreationBlock: [ :builder |  ]
]
