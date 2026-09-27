function tmux-resize-left-staging --description 'Shrink leftmost pane column to a 1/8-width staging area, remaining columns split the rest equally'
    set win_width (tmux display-message -p '#{window_width}')
    if test -z "$win_width"
        echo "tmux-resize-left-staging: not inside tmux" >&2
        return 1
    end

    # One pane_id per distinct column (left x-offset), left-to-right
    set columns (tmux list-panes -F '#{pane_left} #{pane_id}' | sort -n | awk '!seen[$1]++ {print $2}')

    set n (count $columns)
    if test $n -lt 2
        echo "tmux-resize-left-staging: need at least 2 pane columns" >&2
        return 1
    end

    # Each column border eats one width column; exclude those from the split
    set content_width (math --scale=0 "$win_width - ($n - 1)")

    set left_width (math --scale=0 "round($content_width / 8)")
    tmux resize-pane -t "$columns[1]" -x $left_width

    set remaining (math --scale=0 "$content_width - $left_width")
    set other_count (math $n - 1)
    set share (math --scale=0 "round($remaining / $other_count)")

    # Resize every column but the last; the last one absorbs whatever's left over
    for i in (seq 2 (math $n - 1))
        tmux resize-pane -t "$columns[$i]" -x $share
    end
end
