function env
	if test -z "$argv"
		command env | sort
		return
	end

	command env $argv
end
