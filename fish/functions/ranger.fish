# Defined in - @ line 1
function ranger --description 'alias ranger=ranger --choosedir="$HOME/.rangerdir"; cd (cat $HOME/.rangerdir)'
	command ranger --choosedir="$HOME/.rangerdir"; cd (cat $HOME/.rangerdir) $argv;
end
