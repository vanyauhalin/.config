function gh
	switch "$argv"
	case "" -h --help
		command gh $argv
		echo ""
		echo "Additional subcommands:"
		echo "  init                Initialize a new repository."
		if test -z "$argv"
			return 1
		end

	case init
		git init
		command gh repo create

	case \*
		command gh $argv
	end
end
