function git
	switch "$argv"
	case ""
		git --help
		return 1

	case -h --help
		command git $argv
		echo ""
		echo "----------------------"
		echo ""
		echo "Usage: remote-rename <current> <new>"
		echo "       submodule-delete <path>"
		echo ""
		echo "Subcommands:"
		echo "  clean-recursive     ."
		echo "  init                Initialize a new repository with an empty commit."
		echo "  log-diff            Print humanized differences in logs."
		echo "  remote-rename       Rename remote origin and local branches."
		echo "  remote-update       Update remote origin."
		echo "  s                   Show the working tree status."
		echo "  show-diff           Print humanized differences in objects."
		echo "  submodule-delete    Delete the submodule and its directory."
		echo "  undo                Undo the last commit."

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

	case "remote-rename*"
		if not set --query argv[2]
			echo "Error: The current name of the branch is not specified."
			return 1
		end
		set --local current $argv[2]

		if not set --query argv[3]
			echo "Error: The new name of the branch is not specified."
			return 1
		end
		set --local new $argv[3]

		command git branch --unset-upstream $current
		command git push origin --delete $current
		command git branch --move $current $new
		command git push --set-upstream origin $new

	case remote-update
		command git remote update origin --prune

	case s
		command git status

	case show-diff
		command git show --ext-diff

	case "submodule-delete*"
		if not set --query argv[2]
			echo "Error: The path to the submodule isn't specified."
			return 1
		end
		set --local path $argv[2]

		if not test -e .gitmodules
			echo "Error: The command isn't executing near to the .gitmodules file."
			return 1
		end

		command git submodule deinit --force $path
		find .git/modules/$path -delete
		command git rm --force $path

	case undo
		command git reset --soft HEAD~1

	case \*
		command git $argv
	end
end
