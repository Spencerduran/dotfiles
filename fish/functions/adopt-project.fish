function adopt-project --description "Link an existing project folder to a new vault hub, then have claude fill the hub from what's already there"
    argparse 's/source=+' -- $argv; or return 1
    if test (count $argv) -lt 1; or not test -d $argv[1]
        echo "Usage: adopt-project [--source <drive link>]... <existing dir> [Project Name]" >&2
        return 1
    end
    if test -z "$(command ls -A $argv[1])"
        echo "Refusing: $argv[1] is empty. Use new-project instead." >&2
        return 1
    end

    new-project --prompt "This folder already had content before it was linked to the vault. Survey it (README, scripts, data file names, any existing notes) without modifying files. Then fill in the hub note named at the top of CLAUDE.md: the Goal line, a short summary of what exists under Notes, open next steps as Milestones, and a one-line next: in the frontmatter. Ask me before moving or renaming anything in this folder." --source=$_flag_source $argv
end
