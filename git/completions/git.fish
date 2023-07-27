__fisher_find_completion git

complete \
	--command git \
	--condition __fish_use_subcommand \
	--arguments clean-recursive \
	--description ""
complete \
	--command git \
	--condition __fish_use_subcommand \
	--arguments init \
	--description "Initialize a new repository with an empty commit"
complete \
	--command git \
	--condition __fish_use_subcommand \
	--arguments log-diff \
	--description "Print humanized differences in logs"
complete \
	--command git \
	--condition __fish_use_subcommand \
	--arguments remote-rename \
	--description "Rename remote origin and local branches"
complete \
	--command git \
	--condition __fish_use_subcommand \
	--arguments remote-update \
	--description "Update remote origin"
complete \
	--command git \
	--condition __fish_use_subcommand \
	--arguments s \
	--description "Show the working tree status"
complete \
	--command git \
	--condition __fish_use_subcommand \
	--arguments show-diff \
	--description "Print humanized differences in objects"
complete \
	--command git \
	--condition __fish_use_subcommand \
	--arguments submodule-delete \
	--description "Delete the submodule and its directory"
complete \
	--command git \
	--condition __fish_use_subcommand \
	--arguments undo \
	--description "Undo the last commit"
