fish_add_path /sbin /usr/local/bin /usr/sbin

set --global fish_greeting
set --export --global SHELL (command --search fish)

__fisher_autoload
