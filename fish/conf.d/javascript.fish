function __javascript_set_environment
	set -gx NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history
	set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
end
