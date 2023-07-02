set -l file $XDG_CONFIG_HOME/editorconfig/config
set -l content (command cat $file | string collect)
set -l regex "\[\*\.\{(.*?)\}\]"
set -l extenssions (string match --all --groups-only --regex $regex $content)

for extenssion in $extenssions
	set -l pre (string replace --all "," "\n" $extenssion)
	set -l sorted (echo -e $pre | command sort | string collect)
	set -l post (string replace --all --regex "\n" "," $sorted)
	set content (string replace $extenssion $post $content | string collect)
end

echo $content > $file
