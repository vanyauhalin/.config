function __docker_set_environment
	set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
end
