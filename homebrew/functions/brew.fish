function brew
	switch "$argv"
	case ""
		brew --help
		return 1

	case -h --help
		command brew $argv
		echo ""
		echo "Additional subcommands:"
		echo "  export              Export lists of installed formulae and casks."
		echo "  yolo                Run update, upgrade, autoremove and cleanup."

	case autoremove cleanup "install*" "tap*" "uninstall*" "untap*" update "upgrade*"
		command brew $argv
		brew export

	case export
		set --local directory $XDG_CONFIG_HOME/homebrew

		set --local casks_file $directory/casks
		set --local casks_list (command brew list --cask)
		set --local casks_export (
			command brew info --cask $casks_list --json=v2 |
			jq -r '.casks [] | "\(.full_token) \(.installed)"' |
			sort
		)
		set --local casks_content (string join "\n" $casks_export)
		echo -e $casks_content > $casks_file

		set --local formulae_file $directory/formulae
		set --local formulae_list (command brew list --formula)
		set --local formulae_export (
			command brew info --formula $formulae_list --json=v2 |
			jq -r '.formulae [] | "\(.full_name) \(.versions.stable)"' |
			sort
		)
		set --local formulae_content (string join "\n" $formulae_export)
		echo -e $formulae_content > $formulae_file

	case yolo
		command brew update
		command brew upgrade
		command brew autoremove
		command brew cleanup
		brew export

	case \*
		command brew $argv
	end
end
