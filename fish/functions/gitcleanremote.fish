# The script performs the following actions:
#   Retrieves a list of branches that have been merged into the origin/develop branch using the command git branch -r --merged origin/develop.
#   Filters out the origin/develop branch from the list using grep -v 'origin/develop$'.
#   Removes the origin/ prefix from each branch name using sed 's/origin\///'.
#   Starts a loop using while read -l branch to iterate over each branch in the filtered list.
#   Trims any leading or trailing whitespace from the branch name using set branch (string trim -- $branch).
#   Checks if the branch name is not empty using if test -n "$branch".
#   If the branch name is not empty, it performs a git push command to delete the branch from the origin repository using git push origin --delete $branch.
#   Ends the loop using end.

git branch -r --merged origin/develop | grep -v 'origin/develop$' | sed 's/origin\///' | while read -l branch
    set branch (string trim -- $branch)
    if test -n "$branch"
        git push origin --delete $branch
    end
end
