undo/redo
loadState: aMemento
	aMemento ifNil: [ ^ self ].
	self model
		silentlyDo: [ self model name: aMemento model name.
			self model removeAll.
			self model addAll: aMemento model elements ].
	super rebuild.	"call super rebuild, because my rebuild also applies layout"
	self diagram: aMemento diagram.
	self editor updateUndoRedo