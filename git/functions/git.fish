function git
	switch "$argv"
	case "" -h --help
		command git $argv
		echo ""
		echo "Additional subcommands:"
		echo "  clean-recursive     ."
		echo "  init                Initialize a new repository with an empty commit."
		echo "  log-diff            Print humanized differences in logs."
		echo "  s                   Show the working tree status."
		echo "  show-diff           Print humanized differences in objects."
		echo "  undo                Undo the last commit."
		echo "  update              Update remote origins."
		if test -z "$argv"
			return 1
		end

	case clean-recursive
		set repositories $(command find . -name .git | command sort)
		for repository in $repositories
			set directory (string replace /.git "" $repository)
			if test -d $directory
				echo $directory
				command fish --command "cd $directory; git clean -dX --force"
				echo ""
			end
		end

	case init
		command git init
		command git commit --message "Initialize repository" --allow-empty

	case log-diff
		command git log --ext-diff --patch

	case s
		command git status

	case show-diff
		command git show --ext-diff

	case undo
		command git reset --soft HEAD~1

	case update
		command git remote update origin --prune

	case \*
		command git $argv
	end
end
