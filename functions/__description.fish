function __description
	set -l details (functions --details --verbose $argv)
	echo $details[5]
end
