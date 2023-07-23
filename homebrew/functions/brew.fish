function brew
	switch "$argv"
	case "" -h --help
		command brew $argv
		echo ""
		echo "Additional subcommands:"
		echo "  yolo                Run update, upgrade, autoremove and cleanup."
		if test -z "$argv"
			return 1
		end

	case yolo
		command brew update
		command brew upgrade
		command brew autoremove
		command brew cleanup

	case \*
		command brew $argv
	end
end
