function gitcleanremote
git branch -r --merged origin/develop | grep -v 'origin/develop$' | sed 's/origin\///' | while read branch; git push origin --delete $branch;
end
end
