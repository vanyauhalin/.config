function code
	switch "$argv"
	case -h --help
		command code $argv
		echo "----------------------"
		echo ""
		echo "Subcommands:"
		echo "  export              Export key bindings, settings, tasks, and a list of"
		echo "                      extensions."

	case export
		set --local input $XDG_DATA_HOME/Code/User
		set --local output $XDG_CONFIG_HOME/vscode

		cp -r \
			$input/keybindings.json \
			$input/settings.json \
			$input/tasks.json \
			$output

		set --local extensions_file $HOME/.vscode/extensions/extensions.json
		set --local extensions_object (cat $extensions_file)
		set --local extensions (
			echo $extensions_object |
			jq -r '.[] | "\(.identifier.id) \(.version)"' |
			sort
		)
		set --local extensions_content (string join "\n" $extensions)
		echo -e $extensions_content > $output/extensions

	case \*
		command code $argv
	end
end
