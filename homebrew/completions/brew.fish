__fisher_find_completion brew

complete \
	--command brew \
	--condition __fish_use_subcommand \
	--arguments yolo \
	--description "Run update, upgrade, autoremove and cleanup"
