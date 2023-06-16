function __help_message --argument command
	# https://github.com/fish-shell/fish-shell/blob/3.6.1/build_tools/fish_xgettext.fish#L19
	set -l regex '(?:function) (?<name>.*) (?:-d|--description) "(?<description>.*)"'
	set -l prefix (string join "" "__$command" "_")

	echo "Additional subcommands:"

	for func in (functions --all)
		if test (string match --regex $prefix $func)
			set -l name
			set -l description
			set -l path (functions --details $func)
			set -l content (command cat $path)
			string match --regex --quiet $regex $content
			set -l subcommand (
				string replace --all "_" "-" (
					string replace $prefix "" $name
				)
			)

			set -l command_column "  $command $subcommand"
			set -l description_column "  $description."
			set -l gap_size (math 24 - (string length $command_column))
			set -l gap ""
			if test $gap_size -gt 0
				set gap (string repeat --count $gap_size " ")
			else
				set gap "\n                        "
			end

			echo -e $command_column$gap$description_column
		end
	end
end
