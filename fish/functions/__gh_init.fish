function __gh_init --description "Initialize and create a new repository with an empty commit"
	command git init
	command git commit --allow-empty -m "Initialize repository"
	command gh repo create
end
