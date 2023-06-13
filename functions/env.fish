function env
	if test -n "$argv"
		command env | sort
		return
	end

	command env $argv
end
