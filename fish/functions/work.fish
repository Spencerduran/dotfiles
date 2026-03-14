function work
    tmux kill-server 2>/dev/null
    tmux new-session -s work -d -x 300 -y 80
    tmux split-window -h -p 50 -t work
    tmux select-pane -t %0
    tmux split-window -v -p 50
    tmux select-pane -t %0
    tmux split-window -h -p 50
    tmux select-pane -t %2
    tmux split-window -h -p 50
    for pane in %0 %2 %3 %4
        tmux send-keys -t $pane 'claude --dangerously-skip-permissions' Enter
    end
    tmux select-pane -t %0
    tmux attach -t work
end
