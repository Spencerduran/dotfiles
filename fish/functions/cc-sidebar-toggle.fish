function cc-sidebar-toggle
    if not tmux display-message -p '' >/dev/null 2>&1
        echo "Not inside a tmux session"
        return 1
    end

    set active (tmux show-environment -g CC_SIDEBAR_ACTIVE 2>/dev/null | string replace 'CC_SIDEBAR_ACTIVE=' '')

    if test "$active" = 1
        # Turn off: kill all sidebar panes across all windows
        tmux set-environment -g CC_SIDEBAR_ACTIVE 0
        set sidebar_panes (tmux list-panes -s -F '#{pane_id} #{pane_title}' 2>/dev/null \
            | awk '$2 == "cc-sidebar" { print $1 }')
        for pane in $sidebar_panes
            tmux kill-pane -t $pane 2>/dev/null
        end
    else
        # Turn on: set active, then ensure in current window
        tmux set-environment -g CC_SIDEBAR_ACTIVE 1
        cc-sidebar-ensure
    end
end
