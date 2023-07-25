function gh
	switch "$argv"
	case ""
		gh --help
		return 1

	case -h --help
		command gh $argv
		echo ""
		echo "Additional subcommands:"
		echo "  init                Initialize a new repository."

	case init
		git init
		command gh repo create

	case \*
		command gh $argv
	end
end
