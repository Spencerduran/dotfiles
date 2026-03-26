function tree-limited --description "tree with per-subfolder file limit"
    set path (test -n "$argv[1]"; and echo $argv[1]; or echo ".")
    set limit (test -n "$argv[2]"; and echo $argv[2]; or echo "10")
    python3 -c "
import os, sys

def tree(path, limit=10, prefix='', is_root=True):
    try:
        entries = sorted(os.listdir(path))
    except PermissionError:
        return
    show = entries if is_root else entries[:limit]
    hidden = 0 if is_root else max(0, len(entries) - limit)
    for i, name in enumerate(show):
        is_last = (i == len(show) - 1) and hidden == 0
        connector = '└── ' if is_last else '├── '
        print(prefix + connector + name)
        if os.path.isdir(os.path.join(path, name)):
            ext = '    ' if is_last else '│   '
            tree(os.path.join(path, name), limit, prefix + ext, is_root=False)
    if hidden:
        print(prefix + f'└── ... {hidden} more')

tree('$path', $limit)
"
end
