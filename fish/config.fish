status --is-interactive; and source (pyenv init -|psub)
set -gx EDITOR nvim

set -gx TERM "xterm-256color"

# Get the Homebrew prefix
set brew_prefix (brew --prefix)

# Add Homebrew's bin directory to the PATH
fish_add_path $brew_prefix/bin

# Ensure the updated PATH is available to tmux
set -x TMUX_PATH $PATH
#set -g -x NVM_NODEJS_ORG_MIRROR http:/nodejs.org/dist
#set -g -x NODEJS_ORG_MIRROR http://nodejs.org/dist

#set -gx FZF_DEFAULT_COMMAND  'rg -i --files --no-ignore-vcs --hidden --exclude={.git,.idea,.vscode,node_modules,build,tmp,~/.vim/*}'
#set -gx FZF_DEFAULT_OPTS '--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'

#set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore-case --hidden -g "!{.pyenv,.local,.idea,.vscode,tmp,Library,.vim,.git,node_modules,vendor}/*"'
set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore-case --hidden -g "!{.pyenv,.local,.idea,.vscode,tmp,~/Library,/Users/sduran/Library,.vim,.git,node_modules,vendor}/*"'



# Created by `pipx` on 2023-04-21 13:24:15
set PATH $PATH /Users/spencerduran/.local/bin

fish_add_path /Users/spencerduran/.spicetify
