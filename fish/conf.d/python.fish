function __python_set_environment
	set -gx PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python
	set -gx PYTHONSTARTUP $XDG_CONFIG_HOME/python/startup.py
	set -gx PYTHONUSERBASE $XDG_DATA_HOME/python
end
