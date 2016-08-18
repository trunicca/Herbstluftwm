ZSH=~/.oh-my-zsh
ZSH_THEME="nanotech"
# CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
ZSH_CUSTOM=~/.zsh/
plugins=(zsh-output-highlighting zsh-syntax-highlighting colored-man-pages dirhistory command-not-found)
source $ZSH/oh-my-zsh.sh
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
#export EDITOR='vim'
# export ARCHFLAGS="-arch x86_64"
# export SSH_KEY_PATH="~/.ssh/dsa_id"
eval $(dircolors ~/.dircolors)
source $ZSH_CUSTOM/zsh_aliases
source $ZSH_CUSTOM/zsh_functions
