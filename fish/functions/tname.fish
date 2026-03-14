function tname --description "Name the current tmux pane"
    if test (count $argv) -eq 0
        echo "Usage: tname <title>"
        return 1
    end
    tmux select-pane -T "$argv"
end
