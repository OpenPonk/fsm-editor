accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do:
			[ spec
				baseline: 'DynaCASE'
				with: [ spec repository: 'github://dynacase/dynacase/repository' ].
			spec package: 'DynaCASE-FSM' with: [ spec requires: #('DynaCASE') ].
			spec group: 'plugin' with: #('DynaCASE-FSM').
			spec group: 'default' with: #('plugin' 'DynaCASE') ]