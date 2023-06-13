function sudo
	if functions -q $argv[1]
		set argv $SHELL -c "$argv"
	end

	command sudo $argv
end
