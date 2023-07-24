set --local history_file $HOME/.zsh_history
if test -e $history_file
	command rm $history_file
end

set --local sessions_directory $HOME/.zsh_sessions
if test -e $sessions_directory
	command find $sessions_directory -delete
end
