set --export --global XDG_CACHE_HOME $HOME/Library/Caches
set --export --global XDG_CONFIG_HOME $HOME/.config
set --export --global XDG_DATA_HOME $HOME/Library/Application-Support-Alias
set --export --global XDG_DATA_HOME_BACKPORT "$HOME/Library/Application Support"
set --export --global XDG_RUNTIME_DIR (path normalize $TMPDIR)
set --export --global XDG_STATE_HOME $HOME/.local/state

# The problem lies in the fact that not every tool supports handling a path to a
# directory that contains spaces.
# https://github.com/openssl/openssl/issues/4668
if test ! -e $XDG_DATA_HOME
	command ln -s $XDG_DATA_HOME_BACKPORT $XDG_DATA_HOME
end
