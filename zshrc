# Path to your oh-my-zsh configuration.
fpath=($fpath $HOME/conf/zsh/functions)

source $HOME/conf/zsh/scripts/tmux.zsh
source $HOME/conf/zsh/scripts/setopt.zsh
source $HOME/conf/zsh/scripts/exports.zsh
source $HOME/conf/zsh/scripts/prompt.zsh
source $HOME/conf/zsh/scripts/completion.zsh
source $HOME/conf/zsh/scripts/aliases.zsh
source $HOME/conf/zsh/scripts/bindkeys.zsh
source $HOME/conf/zsh/scripts/functions.zsh
source $HOME/conf/zsh/scripts/history.zsh
source $HOME/conf/zsh/scripts/zsh_hooks.zsh 

# Add auto-completion for tmuxp
source tmuxp.zsh


ADOTDIR=$HOME/conf/zsh/bundle
source $HOME/conf/zsh/antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen apply


export VIRTUALENV_DISTRIBUTE=1
export GOPATH=$HOME/Dev/golang/lib
export PIP_DOWNLOAD_CACHE=/var/tmp/pip/
#import profile
source ~/.profile
source ~/.aws

export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
export PATH=~/.bin:$PATH
#export PATH=$PATH:$GOPATH/bin
