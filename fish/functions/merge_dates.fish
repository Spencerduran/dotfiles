#!/usr/bin/env fish

#The script aims to find all branches that have been merged into the origin/develop branch. It performs the following steps:
##Retrieves a list of branches that have been merged into origin/develop using the git branch -r --merged origin/develop command.
##Iterates over each merged branch.
##Trims any leading or trailing whitespace from the branch name.
##Skips the iteration if the branch is the origin/develop branch itself.
##Searches for the merge commit of the branch using git log --merges --oneline $branch..origin/develop | tail -1.
##If a merge commit is found:
##Extracts the commit hash, date, and author information using git show.
##Prints a line indicating that the branch was merged into origin/develop on the specified date by the specified author.
##If no merge commit is found, prints a line indicating that the branch has not been merged into origin/develop.
##In summary, the script provides an overview of branches merged into the origin/develop branch, displaying the date, branch name, and the person who performed the merge.

# Get all branches that have been merged into develop
set merged_branches (git branch -r --merged origin/develop)

for branch in $merged_branches
    # Remove leading and trailing whitespace
    set branch (string trim -- $branch)

    # Skip if the branch is develop
    if test $branch = "origin/develop"
        continue
    end

    # Find the merge commit
    set merge_commit (git log --merges --oneline $branch..origin/develop | tail -1)

    if test -n "$merge_commit"
        # Extract the commit hash, date, and author
        set commit_hash (echo $merge_commit | cut -d' ' -f1)
        set commit_date (git show -s --format=%ci $commit_hash)
        set commit_author (git show -s --format=%an $commit_hash)

        echo "Branch: $branch was merged into develop on $commit_date by $commit_author"
    else
        echo "Branch: $branch has not been merged into develop"
    end
end


