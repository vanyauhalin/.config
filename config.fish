set -gx PATH $PATH /sbin /usr/local/bin /usr/sbin
set -gx SHELL (command -v fish)

__xdg_set_environment
__xdg_backport_data_home

set -gx HISTFILE $XDG_STATE_HOME/shell/history

__docker_set_environment
__fish_set_environment
__homebrew_set_environment
__javascript_set_environment
__less_set_environment
__python_set_environment

__ruby_set_environment
__ruby_use_on_cd

__subversion_set_environment
__swift_set_environment
