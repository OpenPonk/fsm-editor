# OpenPonk: Finite-state machines

[![Nightly](https://github.com/OpenPonk/fsm-editor/actions/workflows/nightly.yml/badge.svg)](https://github.com/OpenPonk/fsm-editor/actions/workflows/nightly.yml) 

This is an unoffical updated version of Finite-state machines extension for [OpenPonk tool](https://openponk.org).

## Installation

Requires Pharo 12 image - clean or with loaded OpenPonk.

In Playground, execute following script:
```
Metacello new
    baseline: 'OpenPonkFsmEditor';
    repository: 'github://OpenPonk/fsm-editor/repository';
    load
```
