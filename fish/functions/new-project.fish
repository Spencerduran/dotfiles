function new-project --description "Create a project directory linked to a hub note in the mind_forge vault, then start claude"
    set -l vault /Users/spencer/vaults/mind_forge
    argparse 'p/prompt=' 's/source=+' -- $argv; or return 1
    if test (count $argv) -lt 1
        echo "Usage: new-project [--prompt <text>] [--source <drive link>]... <dir> [Project Name]" >&2
        return 1
    end
    set -l cwd (path resolve $argv[1])

    # Name: second argument onward, or Title Case of the directory name
    set -l name "$argv[2..]"
    if test -z "$name"
        set -l words
        for w in (string split -n -- ' ' (string replace -ra '[-_ ]+' ' ' (basename $cwd)))
            set -a words (string upper (string sub -l 1 -- $w))(string sub -s 2 -- $w)
        end
        set name (string join ' ' $words)
    end
    string match -q -- '* - Deepgram' $name; or set name "$name - Deepgram"
    echo "Project: $name"

    if test "$cwd" = "$HOME"; or string match -q "$vault*" $cwd
        echo "Refusing: run this from a project directory, not \$HOME or the vault." >&2
        return 1
    end

    set -l existing (find $vault -name "$name.md" -not -path "*/.trash/*" | head -1)
    if test -n "$existing"
        echo "Refusing: hub note already exists at $existing" >&2
        return 1
    end

    if grep -qs $vault $cwd/CLAUDE.md $cwd/.claude/settings.json
        echo "Refusing: $cwd is already linked to the vault." >&2
        return 1
    end

    # Workspace
    mkdir -p $cwd/data $cwd/scripts $cwd/out $cwd/.claude; or return 1
    cd $cwd; or return 1
    if test -d .git
        for d in data/ out/
            grep -qxs $d .gitignore; or echo $d >>.gitignore; or return 1
        end
    end

    # Vault access
    if test -f .claude/settings.json
        set -l tmp (mktemp)
        jq --arg v $vault '.permissions.additionalDirectories = ((.permissions.additionalDirectories // []) + [$v] | unique)' .claude/settings.json >$tmp
        and mv $tmp .claude/settings.json
        or return 1
    else
        printf '{\n  "permissions": {\n    "additionalDirectories": ["%s"]\n  }\n}\n' $vault >.claude/settings.json; or return 1
    end

    # Hub note (Inbox, never 01 - Notes)
    set -l hub "$vault/00 - Inbox/$name.md"
    printf '%s\n' \
        --- \
        'category:' \
        '  - "[[Projects]]"' \
        'subjects:' \
        '  - "[[Deepgram]]"' \
        'type: build' \
        'tags:' \
        '  - deepgram' \
        '  - deepgram-project' \
        "created: "(date +%Y-%m-%d) \
        'status: someday' \
        'project: "[[AI Data Readiness - Deepgram]]"' \
        "workspace: $cwd" \
        'next: ""' \
        --- \
        "# $name" \
        '' \
        '**Goal:** ' \
        '' \
        "**Workspace:** `$cwd` (data, scripts, out)" \
        '' \
        --- \
        '' \
        '## Project Files' \
        '' \
        '```base' \
        'filters:' \
        '  and:' \
        '    - file.hasLink(this.file)' \
        'properties:' \
        '  file.name:' \
        '    displayName: Title' \
        '  note.category:' \
        '    displayName: Category' \
        '  note.status:' \
        '    displayName: Status' \
        'views:' \
        '  - type: table' \
        '    name: All' \
        '    order:' \
        '      - file.name' \
        '      - category' \
        '      - status' \
        '```' \
        '' \
        --- \
        '' \
        '## Milestones' \
        '' \
        '- [ ] ' \
        '' \
        --- \
        '' \
        '## Notes' \
        '' >$hub; or return 1

    # Project CLAUDE.md (prepend if one exists)
    set -l block (printf '%s\n' \
        "# $name" \
        '' \
        "Vault hub: [[$name]] in $vault. Find it by filename; it may be in `00 - Inbox/` or `01 - Notes/`." \
        '' \
        "@$vault/CLAUDE.md" \
        '' \
        '## Project rules' \
        '' \
        '- Raw data stays in `./data/`. Never copy it into the vault.' \
        '- Scripts go in `./scripts/`, generated output in `./out/`.' \
        "- New vault notes for this project go to `00 - Inbox/` with `project: \"[[$name]]\"` and `subjects: [\"[[Deepgram]]\"]`." \
        "- Tasks are TaskNotes in `04 - System/TaskNotes/Tasks/` with `projects: [\"[[$name]]\"]`." \
        '- A chart or PDF worth keeping goes to `04 - System/Attachments/` and is embedded in a note. Everything else stays in `./out/`.' \
        '- Meeting and session transcripts live in `~/vaults/local_memory/`. Cite them by path and timestamp.' | string collect)
    if test -f CLAUDE.md
        set -l rest (command cat CLAUDE.md | string collect)
        printf '%s\n\n%s\n' $block $rest >CLAUDE.md; or return 1
    else
        printf '%s\n' $block >CLAUDE.md; or return 1
    end

    for src in $_flag_source
        add-source $src $cwd
    end

    echo "Created data/ scripts/ out/, .claude/settings.json, CLAUDE.md"
    echo "Hub: $hub"
    if set -q _flag_prompt
        claude $_flag_prompt
    else
        claude
    end
end
