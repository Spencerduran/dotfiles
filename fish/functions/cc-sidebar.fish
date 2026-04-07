function cc-sidebar
    clear

    while true
        set lines
        set now_str (date '+%H:%M:%S')

        set -a lines "\033[1;34m ◆ CC Status\033[0m  \033[2m$now_str  (prefix+s)\033[0m"
        set -a lines ""

        set pane_data (tmux list-panes -s -F '#{pane_id}|#{pane_title}|#{pane_current_path}' 2>/dev/null)

        set has_any 0
        for pane in $pane_data
            set parts (string split '|' $pane)
            set title $parts[2]
            set cwd $parts[3]

            set is_named (string match -q 'claude-*' $title; and echo 1; or echo 0)
            set pane_id $parts[1]
            set status_str (_cc_pane_status $pane_id $cwd)

            if test $is_named -eq 0 -a "$status_str" = idle
                continue
            end

            set has_any 1

            set display_name $title
            if string match -q '*.*' $title
                set display_name (basename $cwd)
            end
            # Truncate name to 24 chars
            set display_name (string sub -l 24 $display_name)

            switch $status_str
                case running
                    set icon "\033[1;36m●\033[0m"
                    set label "\033[36mrunning\033[0m"
                case waiting
                    set icon "\033[1;33m⧗\033[0m"
                    set label "\033[33mwaiting\033[0m"
                case done
                    set icon "\033[2m✓\033[0m"
                    set label "\033[2mdone\033[0m"
                case '*'
                    set icon "\033[2m○\033[0m"
                    set label "\033[2midle\033[0m"
            end

            set thread (_cc_truncate (_cc_thread_name $cwd) 56)

            set -a lines "  $icon  \033[1m$display_name\033[0m   $label"
            if test -n "$thread"
                set -a lines "      \033[2m$thread\033[0m"
            end
            set -a lines ""
        end

        if test $has_any -eq 0
            set -a lines "\033[2m  no active CC sessions\033[0m"
        end

        tput cup 0 0
        for line in $lines
            printf "%b\033[K\n" $line
        end
        tput ed

        sleep 2
    end
end

function _cc_pane_jsonl
    set cwd $argv[1]
    if test -z "$cwd"
        echo ""; return
    end
    set encoded (echo $cwd | sed 's/[^a-zA-Z0-9-]/-/g')
    set project_dir "$HOME/.claude/projects/$encoded"
    if not test -d "$project_dir"
        echo ""; return
    end
    command ls -t "$project_dir"/*.jsonl 2>/dev/null | head -1
end

function _cc_pane_status
    set pane_id $argv[1]
    set cwd $argv[2]

    # Use pane content as the live signal (same approach as recon)
    set pane_content (tmux capture-pane -t "$pane_id" -p 2>/dev/null)
    if test -n "$pane_content"
        # Check last 10 non-empty lines for live signals
        set checked 0
        for line in (string split \n $pane_content | tail -r)
            set trimmed (string trim $line)
            test -z "$trimmed"; and continue

            # Input: needs human — permission prompt (what prefix+u targets)
            if test $checked -eq 0
                if string match -q -- '*Esc to cancel*' $trimmed
                    echo waiting; return
                end
            end
            # Input: selection prompt "❯ <digit>"
            if string match -qr -- '❯\s*[0-9]' $trimmed
                echo waiting; return
            end
            # Working: spinner character + ellipsis
            if string match -qr -- '^[✽✢✳✶✴✵✻✺⏺·].*…' $trimmed
                echo running; return
            end

            set checked (math $checked + 1)
            test $checked -ge 10; and break
        end
    end

    # No live signal — use JSONL recency to distinguish done vs idle
    set jsonl (_cc_pane_jsonl $cwd)
    if test -z "$jsonl"
        echo idle; return
    end
    set mtime (stat -f %m "$jsonl" 2>/dev/null)
    if test -z "$mtime"
        echo idle; return
    end
    set age (math (date +%s) - $mtime)
    if test $age -gt 300
        echo idle; return
    end
    echo done
end

function _cc_truncate
    set str $argv[1]
    set limit $argv[2]
    if test (string length -- $str) -le $limit
        echo $str; return
    end
    set truncated (string sub -l $limit $str | sed 's/ [^ ]*$//')
    echo "$truncated…"
end

function _cc_thread_name
    set cwd $argv[1]
    set jsonl (_cc_pane_jsonl $cwd)
    if test -z "$jsonl"
        echo ""; return
    end

    # First user message that looks like a real prompt
    set user_lines (grep '"role":"user"' "$jsonl" | head -10)
    for line in $user_lines
        # Try array format: [{"type":"text","text":"value"}]
        set text (echo $line | grep -o '"text":"[^"]*"' | head -1 | sed 's/^"text":"//; s/"$//')
        # Fall back to string content format: "content":"value"
        if test -z "$text"
            set text (echo $line | grep -o '"content":"[^"]*"' | head -1 | sed 's/^"content":"//; s/"$//')
        end
        if test -z "$text"
            continue
        end
        # Skip system/internal messages
        if string match -q '<*' $text; or string match -q '{*' $text; or string match -q '\[Request*' $text
            continue
        end
        echo $text
        return
    end
    echo ""
end
