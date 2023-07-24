function env
	switch "$argv"
	case ""
		command env | sort
	case \*
		command env $argv
	end
end
