function __xdg_set_environment
	set -gx XDG_CACHE_HOME $HOME/Library/Caches
	set -gx XDG_CONFIG_HOME $HOME/.config
	set -gx XDG_DATA_HOME "$HOME/Library/Application-Support-Alias"
	set -gx XDG_DATA_HOME_BACKPORT "$HOME/Library/Application Support"
	set -gx XDG_RUNTIME_DIR (path normalize $TMPDIR)
	set -gx XDG_STATE_HOME $HOME/.local/state
end

# The problem lies in the fact that not every tool supports handling a path to a
# directory that contains spaces.
# https://github.com/openssl/openssl/issues/4668
function __xdg_backport_data_home
	if test -e $XDG_DATA_HOME
		return
	end
	command ln -s $XDG_DATA_HOME_BACKPORT $XDG_DATA_HOME
end
