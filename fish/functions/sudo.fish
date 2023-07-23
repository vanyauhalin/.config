function sudo
	if functions -q $argv[1]
		set argv fish --command "$argv"
	end

	command sudo $argv
end
