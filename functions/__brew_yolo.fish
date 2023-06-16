function __brew_yolo --description "Run update, upgrade, autoremove and cleanup"
	command brew update
	command brew upgrade
	command brew autoremove
	command brew cleanup
end
