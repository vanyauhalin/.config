function brew
	set -l options h/help
	argparse -i $options -- $argv

	if set -q _flag_help; and test (count $argv) -eq 0
		command brew $argv
		echo ""
		__help_message brew
		return
	end

	switch "$argv"
	case yolo
		__brew_yolo
	case \*
		command brew $argv
	end
end
