function add-source --description "Register a Google Drive doc under Drive sources in a project's CLAUDE.md (or the parent projects CLAUDE.md)"
    argparse 't/title=' -- $argv; or return 1
    if test (count $argv) -lt 1
        echo "Usage: add-source [--title <text>] <drive link or id> [project dir]" >&2
        return 1
    end
    set -l link $argv[1]

    # Id: /d/<id>/ in Docs, Sheets, Slides and file links; ?id=<id> in open links; or a bare id
    set -l id (string match -rg '/d/([A-Za-z0-9_-]{20,})' -- $link)
    or set id (string match -rg '[?&]id=([A-Za-z0-9_-]{20,})' -- $link)
    or set id (string match -r '^[A-Za-z0-9_-]{20,}$' -- $link)
    or begin
        echo "Can't find a Drive id in: $link" >&2
        return 1
    end

    set -l kind
    switch $link
        case '*/spreadsheets/*'
            set kind 'Google Sheet. '
        case '*/document/*'
            set kind 'Google Doc. '
        case '*/presentation/*'
            set kind 'Google Slides. '
    end

    set -l file /Users/spencer/Documents/projects/CLAUDE.md
    if set -q argv[2]
        set file (path resolve $argv[2])/CLAUDE.md
    end
    if not test -f $file
        echo "No CLAUDE.md at $file. Run new-project or adopt-project first." >&2
        return 1
    end
    if grep -q -- $id $file
        echo "Already registered in $file"
        return 0
    end

    set -l title (string trim -- "$_flag_title")
    test -n "$title"; or set title '(untitled)'
    set -l entry "- $title: $kind""id `$id`"

    if grep -q '^## Drive sources' $file
        # Insert after the section's last non-blank line, before the next heading
        set -l tmp (mktemp)
        awk -v entry="$entry" '
            /^## Drive sources/ { ins = 1; print; next }
            ins && /^## / { print entry; for (i = 0; i < nb; i++) print ""; nb = 0; ins = 0 }
            ins && /^$/ { nb++; next }
            ins { for (i = 0; i < nb; i++) print ""; nb = 0 }
            { print }
            END { if (ins) print entry }
        ' $file >$tmp
        and mv $tmp $file
        or return 1
    else
        printf '\n## Drive sources\n\n%s\n' $entry >>$file; or return 1
    end
    echo "Added to $file: $entry"
end
