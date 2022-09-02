#pyenv init - | source
status --is-interactive; and source (pyenv init -|psub)
set -gx EDITOR nvim
#set -g -x NVM_NODEJS_ORG_MIRROR http:/nodejs.org/dist
#set -g -x NODEJS_ORG_MIRROR http://nodejs.org/dist

#set -gx FZF_DEFAULT_COMMAND  'rg -i --files --no-ignore-vcs --hidden --exclude={.git,.idea,.vscode,node_modules,build,tmp,~/.vim/*}'
#set -gx FZF_DEFAULT_OPTS '--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'

#set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore-case --hidden -g "!{.pyenv,.local,.idea,.vscode,tmp,Library,.vim,.git,node_modules,vendor}/*"'
set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore-case --hidden -g "!{.pyenv,.local,.idea,.vscode,tmp,~/Library,/Users/sduran/Library,.vim,.git,node_modules,vendor}/*"'
#set -U -x AWS_CA_BUNDLE '/usr/local/share/ca-certificates/Quicken_Loans_Root_CA.crt'
set -U -x AWS_SDK_LOAD_CONFIG
set -U -x AWS_CA_BUNDLE '~/.ssh/qlca.pem'
set -U -x AWS_SHARED_CREDENTIALS_FILE '/Users/sduran/Downloads/credentials'


