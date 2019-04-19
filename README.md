# OpenPonk: Finite-state machines

[![Build Status](https://travis-ci.org/OpenPonk/fsm-editor.svg?branch=master)](https://travis-ci.org/OpenPonk/fsm-editor)

This is an unoffical updated version of Finite-state machines extension for [OpenPonk tool](https://openponk.org) that adds finite state machines.

## Installation for usage

Requires Pharo 6.1.
Loading requires running one of following scripts. Which one is it depends whether you alreade have OpenPonk image or OpenPonk loaded to your image:

If you have OpenPonk image (OpenPonk 1.x from https://openponk.org/) or OpenPonk loaded into your image:
```
	IceRepository reset.
	Metacello new
		baseline: 'FsmEditor';
		repository: 'github://OpenPonk/fsm-editor/repository';
		onConflictUseLoaded;
		onWarning: [ :warning | 
			(warning isKindOf: MCMergeOrLoadWarning)
				ifTrue: [ warning load ]
				ifFalse: [ (warning messageText beginsWith: 'This package depends')
						ifTrue: [ warning resume ]
						ifFalse: [ warning pass ] ] ];
		load
 ```
If you have (clean) image without OpenPonk (loading will take several minutes):
```
Metacello new
    baseline: 'FsmEditor';
    repository: 'github://OpenPonk/fsm-editor/repository';
    load
```

## Installation for development

Requires Pharo 6.1.

1. Update Iceberg using script for Pharo 6.1 on https://github.com/pharo-vcs/iceberg
1. Clone the repository via Iceberg
1. Install default baseline BaselineOfFsmEditor
