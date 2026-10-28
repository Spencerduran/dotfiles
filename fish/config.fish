status --is-interactive; and source (pyenv init -|psub)
set -gx EDITOR nvim

set -gx TERM "xterm-256color"

# Get the Homebrew prefix
set brew_prefix (brew --prefix)

# Add Homebrew's bin directory to the PATH
fish_add_path $brew_prefix/bin

# Unversioned python3/pip3 from brew's python@3.12 (macOS python3 is 3.9, too old for hook scripts)
fish_add_path $brew_prefix/opt/python@3.12/libexec/bin

# cargo install puts binaries here (recon, etc.)
fish_add_path $HOME/.cargo/bin

# bun (claude-mem plugin hooks and other bun tools)
fish_add_path $HOME/.bun/bin

# Ensure the updated PATH is available to tmux
set -x TMUX_PATH $PATH
#set -g -x NVM_NODEJS_ORG_MIRROR http:/nodejs.org/dist
#set -g -x NODEJS_ORG_MIRROR http://nodejs.org/dist

#set -gx FZF_DEFAULT_COMMAND  'rg -i --files --no-ignore-vcs --hidden --exclude={.git,.idea,.vscode,node_modules,build,tmp,~/.vim/*}'
#set -gx FZF_DEFAULT_OPTS '--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'

#set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore-case --hidden -g "!{.pyenv,.local,.idea,.vscode,tmp,Library,.vim,.git,node_modules,vendor}/*"'
set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore-case --hidden -g "!{.pyenv,.local,.idea,.vscode,tmp,Library,.vim,.git,node_modules,vendor}/*"'



# Created by `pipx` on 2023-04-21 13:24:15
set PATH $PATH $HOME/.local/bin


# LS_COLORS for tree, bat, fzf file coloring, etc.
if command -q vivid
    set -gx LS_COLORS (vivid generate catppuccin-mocha)
end

# Claude memory vault
set -gx VAULT_DIR ~/vaults/local_memory

# Claude sessions alias
alias cs="python3 ~/.claude/plugins/marketplaces/personal-os-skills/skills/sync-claude-sessions/scripts/claude-sessions"
