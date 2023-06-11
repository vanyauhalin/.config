function gh
	set -l options h/help
	argparse -i $options -- $argv

	if set -q _flag_help
		__gh_help_message
		return
	end

	switch "$argv"
	case init
		__gh_init
	case \*
		command gh $argv
	end
end

function __gh_help_message
	command gh $_flag_help
	echo ""
	echo "Additional subcommands:"
	echo "  gh init  $(__description __gh_init)"
end

function __gh_init --description "Initialize and create a new repository with an empty commit"
	command git init
	command git commit --allow-empty -m "Initialize repository"
	command gh repo create
end
