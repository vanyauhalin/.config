function __fish_set_environment
	set -g fish_greeting
end

function fish_title
	# Don't remove this function; it serves as a placeholder to keep the title
	# window empty.
end

function fish_prompt
	set -l pwd (__promt_pwd)
	set -l git (__promt_git)
	set -l symbol "\$ "

	set -l promt $pwd

	if test $git
		set promt $promt\n$git
	end

	set promt $promt\n$symbol

	echo $promt
end

function __promt_pwd
	set -g fish_prompt_pwd_dir_length 0
	# Don't remove the trailing space is a dirty trick to retain the last
	# character when the path is too long.
	echo (set_color green)(prompt_pwd) (set_color normal)
end

function __promt_git
	set -g __fish_git_prompt_color normal
	set -g __fish_git_prompt_color_branch magenta
	set -g __fish_git_prompt_char_stateseparator ""
	set -g __fish_git_prompt_showdirtystate true
	set -g __fish_git_prompt_showuntrackedfiles true

	set -l separator \|

	set -l unstaged (set_color red)unstaged(set_color normal)
	set -g __fish_git_prompt_char_dirtystate $separator$unstaged

	set -l unmerged (set_color red)unmerged(set_color normal)
	set -g __fish_git_prompt_char_invalidstate $separator$unmerged

	set -l staged (set_color green)staged(set_color normal)
	set -g __fish_git_prompt_char_stagedstate $separator$staged

	set -l untracked (set_color red)untracked(set_color normal)
	set -g __fish_git_prompt_char_untrackedfiles $separator$untracked

	set -l fish_promt (string split $separator (fish_git_prompt %s))
	set -l branch $fish_promt[1]
	set -l changes (string join " " $fish_promt[2..-1])
	set -l promt

	if test $branch
		set promt $promt on $branch
	end

	if test $changes
		set promt $promt with $changes
	end

	echo (string join " " $promt)
end

function fish_right_prompt
	set -l code $status

	set -l duration
	set -l miliseconds $CMD_DURATION
	if test $miliseconds -gt 0
		set -l seconds (math $miliseconds / 1000)
		set -l minutes (math $seconds / 60)
		set -l hours (math $minutes / 60)
		set -l days (math $hours / 60)
		if test $days -gt 1
			set duration $days\d
		else if test $hours -gt 1
			set duration $hours\h
		else if test $minutes -gt 1
			set duration $minutes\m
		else if test $seconds -gt 1
			set duration $seconds\s
		else
			set duration $miliseconds\ms
		end
	end

	set -l promt
	set -l duration_color

	if test $code -gt 0
		set colored_code (set_color -d red)$code(set_color normal)
		set promt $promt $colored_code
		set duration_color red
	else
		set duration_color black
	end

	if test -n $duration
		set colored_duration (set_color -d $duration_color)$duration(set_color normal)
		set promt $promt $colored_duration
	end

	echo (string join " " $promt)
end
