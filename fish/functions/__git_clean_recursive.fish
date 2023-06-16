function __git_clean_recursive --description ""
	set repositories $(command find . -name .git | command sort)
	for repository in $repositories
		set directory (string replace /.git "" $repository)
		if test -d $directory
			echo $directory
			command fish -c "cd $directory; git clean -dfX"
			echo ""
		end
	end
end
