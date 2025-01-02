function update
    # First gather all git directories
    set git_dirs (find . -maxdepth 2 -type d -name .git | sed 's/\/\.git$//')
    
    # Then process them
    for d in $git_dirs
        echo "Attempting to update: $d"
        pushd $d >/dev/null
        git pull --ff-only
            or echo "Warning: Could not fast-forward $d"
        popd >/dev/null
    end
end
