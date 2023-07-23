function __fisher_autoload
	set fisher_path $XDG_CONFIG_HOME/fish/plugins
	set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
	set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

	for file in $fisher_path/conf.d/*.fish
		source $file
	end
end
