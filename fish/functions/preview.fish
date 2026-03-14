function preview -d "Render documents in terminal using markitdown + glow"
    if test (count $argv) -eq 0
        echo "Usage: preview <file>"
        return 1
    end

    set -l file "$argv[1]"

    if not test -f "$file"
        echo "File not found: $file"
        return 1
    end

    set -l ext (string lower (string replace -r '.*\.' '' "$file"))

    switch $ext
        case md
            glow "$file"
        case docx xlsx pptx pdf html htm
            markitdown "$file" | glow -
        case '*'
            cat "$file"
    end
end
