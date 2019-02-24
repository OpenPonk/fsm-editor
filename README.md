# OpenPonk Finite-state machines

![Travis build status](https://travis-ci.org/JanBliznicenko/fsm-editor.svg?branch=master)](https://travis-ci.org/JanBliznicenko/fsm-editor)

This repository adds finite state machines to the OpenPonk tool.

## Installation for usage

Requires Pharo 6.1.

Slow loading with any image without OpenPonk: In Playground, run following code:
```
Metacello new
    baseline: 'FsmEditor';
    repository: 'github://JanBliznicenko/fsm-editor/repository';
    load
```
Fast loading with OpenPonk image: Download OpenPonk 1.0.0 from https://openponk.org/, open it and in Playground, run following code:
```
	IceRepository reset.
	Metacello new
		baseline: 'FsmEditor';
		repository: 'github://JanBliznicenko/fsm-editor/repository';
		onConflictUseLoaded;
		onWarning: [ :warning | 
			(warning isKindOf: MCMergeOrLoadWarning)
				ifTrue: [ warning load ]
				ifFalse: [ (warning messageText beginsWith: 'This package depends')
						ifTrue: [ warning resume ]
						ifFalse: [ warning pass ] ] ];
		load
 ```

## Installation for development

Requires Pharo 6.1.

1. Update Iceberg using script for Pharo 6.1 on https://github.com/pharo-vcs/iceberg
1. Clone the repository via Iceberg
1. Install default baseline BaselineOfFsmEditor
