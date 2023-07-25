function brew
	switch "$argv"
	case "" -h --help
		command brew $argv
		echo ""
		echo "Additional subcommands:"
		echo "  export              Export lists of manually installed formulae and casks."
		echo "  yolo                Run update, upgrade, autoremove and cleanup."
		if test -z "$argv"
			return 1
		end

	case autoremove cleanup "install*" "tap*" "uninstall*" "untap*" update "upgrade*"
		command brew $argv
		brew export

	case export
		set --local directory $XDG_CONFIG_HOME/homebrew

		set --local casks_file $directory/casks
		set --local casks (command brew list --cask --version)
		set --local casks_content (string join "\n" $casks)
		echo -e $casks_content > $casks_file

		set --local requested (command brew leaves --installed-on-request)
		set --local formulae (command brew list --formula --version)
		set --local export

		for item in $requested
			set --local exported

			for formula in $formulae
				set --local matched (string match "$item*" $formula)
				if test $matched
					set exported $matched
					break
				end
			end

			if test $exported
				set --append export $exported
			else
				set --append export $item
			end
		end

		set --local formulae_file $directory/formulae
		set --local formulae_content (string join "\n" $export)
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
