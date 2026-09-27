function cc-color --description 'Tag the current tmux pane with a color and send /color to the Claude session in it'
    set name $argv[1]
    set valid red blue green yellow purple orange pink cyan default
    if not contains -- $name $valid
        echo "cc-color: invalid color '$name'. Choose from: $valid" >&2
        return 1
    end

    set pane_id (tmux display-message -p '#{pane_id}')
    if test -z "$pane_id"
        echo "cc-color: not inside tmux" >&2
        return 1
    end

    # Exact truecolor hex from Claude Code's "dark-daltonized" theme palette (named/256
    # tmux colors resolve through Ghostty's custom ANSI palette and don't actually match
    # what Claude renders -- update these if the Claude Code theme ever changes)
    switch $name
        case red
            set tmux_color '#FF6666'
        case blue
            set tmux_color '#66B2FF'
        case green
            set tmux_color '#66FF66'
        case yellow
            set tmux_color '#FFFF66'
        case purple
            set tmux_color '#B266FF'
        case orange
            set tmux_color '#FFB266'
        case pink
            set tmux_color '#FF99CC'
        case cyan
            set tmux_color '#66CCCC'
        case default
            set tmux_color default
    end

    if test "$name" = default
        tmux set-option -pu -t $pane_id @cc_color
        tmux set-option -pu -t $pane_id @cc_color_tmux
    else
        tmux set-option -p -t $pane_id @cc_color $name
        tmux set-option -p -t $pane_id @cc_color_tmux $tmux_color
    end

    # Sync the actual Claude Code prompt-bar color too
    tmux send-keys -t $pane_id "/color $name" Enter
end
