# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
RAILS_ENV=development

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias b="bundle exec"
alias -g se='| grep -i'
alias runso="bundle exec rails s -p 3030"
alias runmso="bundle exec rails s"
alias vim='/Applications/MacVim.app/Contents/MacOS/vim'
alias -s log="less -MN"
alias -s rb=vim

# http://zshwiki.org/home/builtin/functions/zmv
autoload -U zmv

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=31

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="yyyy/mm/dd"
HISTSIZE=1000
SAVEHIST=1000

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby brew bundler forklift gem github history postgres pow rails rake tmux vi-mode zsh-syntax-highlighting history-substring-search)

source $ZSH/oh-my-zsh.sh
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export CC=/usr/local/bin/gcc-4.2
export CXX=/usr/local/bin/g++-4.2
export PATH="/usr/local/heroku/bin:/Library/PostgreSQL/9.3/data:$PATH"
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PGDATA=/Library/PostgreSQL/9.3/data/
export EDITOR=vim
export GIT_EDITOR=vim

#eval "$(rbenv init -)"
eval "$(rbenv init --no-rehash - zsh)"


# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

