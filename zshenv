# Dont read global configs
unsetopt GLOBAL_RCS

# Set the path to dotzsh.
export DOTZSH="$HOME/.zsh"

# Source environment settings
source "$DOTZSH/env.zsh"

# Initialize gvm
source $HOME/.gvm/scripts/gvm
export GOPATH=$GOPATH:$HOME/develop/gopath
