# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="fino"
# ZSH_THEME="steeef"
# ZSH_THEME="sporty_256"
# ZSH_THEME="bira"
# ZSH_THEME="powerline"
ZSH_THEME="bullet-train"
# for list of colors run spectrum_ls
BULLETTRAIN_DIR_EXTENDED=2
BULLETTRAIN_TIME_SHOW=false
BULLETTRAIN_CONTEXT_SHOW=false
ULLETTRAIN_IS_SSH_CLIENT=true
BULLETTRAIN_NVM_SHOW=true
BULLETTRAIN_NVM_BG=022
BULLETTRAIN_NVM_FG=253
BULLETTRAIN_RUBY_BG=235
BULLETTRAIN_RUBY_FG=red
BULLETTRAIN_GO_SHOW=true
BULLETTRAIN_DIR_BG=232
BULLETTRAIN_DIR_FG=226
BULLETTRAIN_GIT_BG=233
BULLETTRAIN_GIT_FG=214

RAILS_ENV=development

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias b="bundle exec"
alias bs="brew services"
alias -g se='| grep -i'
# alias vim='/Applications/MacVim.app/Contents/MacOS/vim'
alias -s log="less -MN"
alias -s rb=vim
alias gdw="git diff --color-words"
alias dcom="docker-compose"
alias dockerip='docker ps | tail -n +2 | while read cid b; do echo -n "$cid\t"; docker inspect $cid | grep IPAddress | cut -d \" -f 4; done'
docker-ip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

fpath=(~/.zsh/completion $fpath)

# http://zshwiki.org/home/builtin/functions/zmv
autoload -U zmv
autoload -Uz compinit && compinit -i

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
HISTSIZE=10000
SAVEHIST=10000

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby brew bundler autojump gem github history postgres pow rails \
         rake tmux vi-mode zsh-syntax-highlighting dircycle history-substring-search)

source $ZSH/oh-my-zsh.sh
# source ~/.autojump/etc/profile.d/autojump.zsh
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# if [ -f `brew --prefix`/etc/autojump ]; then
#   . `brew --prefix`/etc/autojump
# fi

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
# export CC=/usr/local/bin/gcc-5
# export CXX=/usr/local/bin/g++-5
# export CPP=/usr/local/bin/cpp-5
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
export PGDATA=~/Library/PostgreSQL/9.5/data/
export EDITOR=vim
export GIT_EDITOR=vim
export TERM="xterm-256color"

#eval "$(rbenv init -)"
eval "$(rbenv init --no-rehash - zsh)"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# To have launchd start mongodb at login:
# ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
# Then to load mongodb now:
# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
# Or, if you don't want/need launchctl, you can just run:
# mongod --config /usr/local/etc/mongod.conf
