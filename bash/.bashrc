
column_numbers() {
        pbpaste > ~/scrap.csv
        head -1 ~/scrap.csv | tr '\t' '\012' | nl
}

backup() {
        cp -rvf ~/Documents ~/OneDrive\ -\ Knex/Documents/testfolder
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
