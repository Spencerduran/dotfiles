function cc-sidebar-ensure
    # No-op if sidebar is globally off
    set active (tmux show-environment -g CC_SIDEBAR_ACTIVE 2>/dev/null | string replace 'CC_SIDEBAR_ACTIVE=' '')
    if test "$active" != 1
        return 0
    end

    set window_id (tmux display-message -p '#{window_id}' 2>/dev/null)
    if test -z "$window_id"
        return 0
    end

    # Check if sidebar pane already exists in this window
    set sidebar_pane (tmux list-panes -t "$window_id" -F '#{pane_id} #{pane_title}' 2>/dev/null \
        | awk '$2 == "cc-sidebar" { print $1 }')

    if test -z "$sidebar_pane"
        # -f spans full window height regardless of pane layout
        set new_pane (tmux split-window -h -f -l 25 -d -P -F '#{pane_id}' '~/.cargo/bin/recon --sidebar' 2>/dev/null)
        if test -n "$new_pane"
            tmux select-pane -t "$new_pane" -T "cc-sidebar"
        end
    end
end
