status --is-interactive; and source (pyenv init -|psub)
set -gx EDITOR nvim
set -g -x NVM_NODEJS_ORG_MIRROR http:/nodejs.org/dist
set -g -x NODEJS_ORG_MIRROR http://nodejs.org/dist

set -gx FZF_DEFAULT_COMMAND  'rg -i --files --no-ignore-vcs --hidden'

export AWS_CA_BUNDLE=/usr/local/share/ca-certificates/Quicken_Loans_Root_CA.crt
