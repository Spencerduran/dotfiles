function ff
	set choice (rg -il $argv | fzf -0 -1 --ansi --preview "cat {} | rg $argv --context 3")
    if [ $choice ]
        /usr/local/bin/vim "+/"($argv) $choice
    end
end
