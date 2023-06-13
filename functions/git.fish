function git
	set -l options h/help
	argparse -i $options -- $argv

	if set -q _flag_help
		__git_help_message
		return
	end

	switch "$argv"
	case clean-recursive
		__git_clean_recursive
	case log-diff
		__git_log_diff
	case s
		__git_s
	case show-diff
		__git_show_diff
	case undo
		__git_undo
	case update
		__git_update
	case \*
		command git $argv
	end
end

function __git_help_message
	command git $_flag_help
	echo ""
	echo "Additional subcommands:"
	echo "  git clean-recursive  $(__description __git_clean_recursive)"
	echo "  git log-diff         $(__description __git_log_diff)"
	echo "  git s                $(__description __git_s)"
	echo "  git show-diff        $(__description __git_show_diff)"
	echo "  git undo             $(__description __git_undo)"
	echo "  git update           $(__description __git_update)"
end

function __git_clean_recursive --description ""
	set repositories $(command find . -name .git | command sort)
	for repository in $repositories
		set directory (string replace /.git "" $repository)
		if test -d $directory
			echo $directory
			$SHELL -c "cd $directory; git clean -dfX"
			echo ""
		end
	end
end

function __git_log_diff --description "Print humanized differences in logs"
	command git log -p --ext-diff
end

function __git_s --description "Show the working tree status"
	command git status
end

function __git_show_diff --description "Print humanized differences in objects"
	command git show --ext-diff
end

function __git_undo --description "Undo the last commit"
	command git reset --soft HEAD~1
end

function __git_update --description "Update remote origins"
	git remote update origin --prune
end
