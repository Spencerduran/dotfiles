function gitmerged
git branch -r --merged origin/develop | egrep -v "(^\*|main|master|develop)"
end
