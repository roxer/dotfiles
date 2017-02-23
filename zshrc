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
BULLETTRAIN_PROMPT_CHAR=' $ '
BULLETTRAIN_PROMPT_ORDER=(
  status
  custom
  dir
  ruby
  virtualenv
  nvm
  go
  git
  cmd_exec_time
)

RAILS_ENV=development

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fpath=(~/.zsh/completion $fpath)

# http://zshwiki.org/home/builtin/functions/zmv
autoload -U zmv
autoload -Uz compinit && compinit -i

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# install syntax-higlighting first
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
plugins=(git osx go mix ruby brew bundler autojump gem \
         docker docker-compose \
         github postgres pow rails \
         zsh-autosuggestions httpie rake tmux vi-mode dircycle \
         zsh-syntax-highlighting history-substring-search) # always last 2 items

source $ZSH/oh-my-zsh.sh

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
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="yyyy/mm/dd"

setopt BANG_HIST               # Treat the '!' character specially during expansion.
# setopt EXTENDED_HISTORY        # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY      # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY           # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS        # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS       # Do not display a line previously found.
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY             # Don't execute immediately upon history expansion.
# HISTTIMEFORMAT="%d/%m/%y %T "
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob # example: print -l ^*jpg

# source ~/.autojump/etc/profile.d/autojump.zsh
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source ~/.zsh/aliases.zsh
source ~/.zsh/abbreviations.zsh
source ~/.zsh/functions.zsh

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# if [ -f `brew --prefix`/etc/autojump ]; then
#   . `brew --prefix`/etc/autojump
# fi

# User configuration

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
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:/usr/local/man:$MANPATH"

export PATH="/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/go/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$(brew --prefix sqlite)/bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
# export PGDATA=~/Library/PostgreSQL/9.5/data/
export PGDATA=/usr/local/var/postgres-9.6/
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --caskroom=/opt/homebrew-cask/Caskroom"
export EDITOR=vim
export GIT_EDITOR=vim
export TERM="xterm-256color"
export GOPATH=$HOME/go
export CLICOLOR=1

eval "$(rbenv init --no-rehash - zsh)"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

if (( $+commands[tag] )); then
  # https://github.com/aykamko/tag OR https://github.com/sampson-chen/sack

  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
  alias ag=tag
fi

unalias rg # https://github.com/BurntSushi/ripgrep (insted rails generate)

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# To have launchd start mongodb at login:
# ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
# Then to load mongodb now:
# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
# Or, if you don't want/need launchctl, you can just run:
# mongod --config /usr/local/etc/mongod.conf

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [[ -s "$HOME/.gvm/scripts/gvm" ]]; then
  source "$HOME/.gvm/scripts/gvm"

  if [[ -s "$HOME/.gvm/scripts/completion" ]]; then
    autoload -Uz bashcompinit
    bashcompinit
    source "$HOME/.gvm/scripts/completion"
  fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
