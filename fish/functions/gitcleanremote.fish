git branch -r --merged origin/develop | grep -v 'origin/develop$' | sed 's/origin\///' | while read -l branch
    set branch (string trim -- $branch)
    if test -n "$branch"
        git push origin --delete $branch
    end
end
