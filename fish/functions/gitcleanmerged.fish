function gitcleanmerged
	git branch --merged | egrep -v "(^\*|master|develop|main)" | xargs git branch -d
end
