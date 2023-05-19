#!/usr/bin/env fish

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


