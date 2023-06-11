function brew
	set -l options h/help
	argparse -i $options -- $argv

	if set -q _flag_help
		__brew_help_message
		return
	end

	switch "$argv"
	case yolo
		__brew_yolo
	case \*
		command brew $argv
	end
end

function __brew_help_message
	command brew $_flag_help
	echo ""
	echo "Additional subcommands:"
	echo "  brew yolo  $(__description __brew_yolo)"
end

function __brew_yolo --description "Run update, upgrade, autoremove and cleanup"
	command brew update
	command brew upgrade
	command brew autoremove
	command brew cleanup
end
