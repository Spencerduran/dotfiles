function develop_status
    # initialize a list to hold branches that are behind
    set -l behind_branches ""

    # fetch latest from origin
    git fetch origin

    # check if "develop" branch exists
    if not git show-ref --quiet --verify refs/heads/develop
        echo "The 'develop' branch doesn't exist locally. Please create it first."
        return 1
    end

    # loop over each local branch
    for branch in (git branch | string trim | string replace '*' '')
        set branch (string trim $branch) # trim the branch name again after removing '*'

        # ignore develop and main branch
        if test $branch != "develop"; and test $branch != "main"
            echo "Checking branch $branch"
            
            # check if branch is empty or contains special characters
            if not string length -q -- $branch
                echo "Invalid branch name: '$branch'"
                continue
            end

            # compare the branch to develop
            set -l comparison (git rev-list --count develop..$branch 2>/dev/null)

            # check if comparison has a valid result
            if not string length -q -- $comparison
                echo "Unable to compare branch '$branch' to 'develop'"
                continue
            end

            # if the branch is behind, add it to the list
            if test $comparison -gt 0
                set -a behind_branches $branch
            end
        end
    end

    # print out branches that are behind develop
    if test (count $behind_branches) -gt 0
        echo
        echo "The following branches are behind 'develop':"
        for branch in $behind_branches
            echo $branch
        end
    else
        echo "No branches are behind 'develop'."
    end
end

function develop_merge
    # initialize a list to hold branches that had merge conflicts
    set -l conflict_branches ""

    # fetch latest from origin
    git fetch origin

    # check if "develop" branch exists
    if not git show-ref --quiet --verify refs/heads/develop
        echo "The 'develop' branch doesn't exist locally. Please create it first."
        return 1
    end

    # checkout and pull latest changes to develop branch
    git checkout develop
    git pull

    # loop over each local branch
    for branch in (git branch | string trim | string replace '*' '')
        set branch (string trim $branch) # trim the branch name again after removing '*'

        # ignore develop and main branch
        if test $branch != "develop"; and test $branch != "main"
            echo "Checking branch $branch"
            
            # check if branch is empty or contains special characters
            if not string length -q -- $branch
                echo "Invalid branch name: '$branch'"
                continue
            end

            # compare the branch to develop
            set -l comparison (git rev-list --count develop..$branch 2>/dev/null)

            # check if comparison has a valid result
            if not string length -q -- $comparison
                echo "Unable to compare branch '$branch' to 'develop'"
                continue
            end

            # if the branch is behind, attempt a merge
            if test $comparison -gt 0
                git checkout $branch
                # try to merge develop into the branch
                if not git merge develop
                    # if the merge fails (due to conflicts), abort the merge and add the branch to the list
                    git merge --abort
                    set -a conflict_branches $branch
                    echo "Merge conflict in branch '$branch', aborting merge."
                end
            end
        end
    end

    # print out branches that had merge conflicts
    if test (count $conflict_branches) -gt 0
        echo
        echo "The following branches had merge conflicts with 'develop':"
        for branch in $conflict_branches
            echo $branch
        end
    else
        echo "No merge conflicts with 'develop'."
    end

    # Switch back to develop branch
    git checkout develop
end
