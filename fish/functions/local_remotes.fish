function local_remotes
git branch -r | awk '{print $1}' | cut -d '/' -f 2- | while read -l remote_branch
    if git show-ref --verify --quiet "refs/heads/$remote_branch"
        if not string match -q "develop" $remote_branch
            if not string match -q "main" $remote_branch
                echo $remote_branch
            end
        end
    end
end
end
