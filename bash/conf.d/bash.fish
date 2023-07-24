set --local history_file $HOME/.bash_history
if test -e $history_file
	command rm $history_file
end
