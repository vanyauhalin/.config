function __git_undo --description "Undo the last commit"
	command git reset --soft HEAD~1
end
