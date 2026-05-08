function tasks --description "Browse active TaskNotes in neovim via fzf, sorted by priority"
    set tasks_dir ~/vaults/mind_forge/04\ -\ System/TaskNotes/Tasks

    set filter "^status: open"
    if test (count $argv) -gt 0
        set filter "^status: $argv[1]"
    end

    set selected (
        for f in (rg $filter $tasks_dir -g "*.md" -l)
            set prio (rg "^priority:" $f | string replace -r "priority: " "")
            printf "%s\t%s\n" $prio $f
        end | sort -r | cut -f2 \
        | fzf --preview "bat --style=plain --color=always {}" \
              --preview-window "right:60%"
    )

    if test -n "$selected"
        nvim $selected
    end
end
