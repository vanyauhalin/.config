function gh
	set -l options h/help
	argparse -i $options -- $argv

	if set -q _flag_help; and test (count $argv) -eq 0
		command gh $argv
		__help_message gh
		return
	end

	switch "$argv"
	case init
		__gh_init
	case \*
		command gh $argv
	end
end
