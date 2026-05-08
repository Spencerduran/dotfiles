function sync-successful-call-def
    set repo $HOME/Documents/200_Areas/MLG/my_mlg_repos/successful_call/DEFINITION.md
    set vault "$HOME/vaults/mind_forge/00 - Inbox/funnel successful call definition.md"

    if not test -f $repo
        echo "Error: repo file not found at $repo"
        return 1
    end

    if not test -f $vault
        echo "Error: vault note not found at $vault"
        return 1
    end

    # Find the line number of the closing --- of the frontmatter block
    set fm_end (grep -n '^---$' $vault | awk -F: 'NR==2{print $1}')
    if test -z "$fm_end"
        echo "Error: no frontmatter found in vault note"
        return 1
    end

    set tmp (mktemp /tmp/sync-successful-call.XXXXXX)
    head -n $fm_end $vault > $tmp
    printf '\n' >> $tmp
    cat $repo >> $tmp
    cp $tmp $vault
    rm $tmp
    echo "Synced: DEFINITION.md → vault note"
end
