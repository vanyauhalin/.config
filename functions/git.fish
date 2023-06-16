function git
	set -l options h/help
	argparse -i $options -- $argv

	if set -q _flag_help; and test (count $argv) -eq 0
		command git $argv
		echo ""
		__help_message git
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
