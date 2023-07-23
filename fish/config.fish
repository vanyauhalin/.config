fish_add_path /sbin /usr/local/bin /usr/sbin

set --global fish_greeting
set --export --global SHELL (command -v fish)
set --export --global HISTFILE $XDG_STATE_HOME/shell/history

__fisher_autoload
