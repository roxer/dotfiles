# vi:ft=ruby:
tap 'homebrew/services'
tap 'homebrew/versions'
tap 'homebrew/dupes'
tap 'universal-ctags/universal-ctags'
tap 'caskroom/cask'
tap 'aykamko/tag-ag'

# brew 'redline'    # ???? check zsh for similar tool
# brew 'memcached'

# Install GNU core utilities (those that come with OS X are outdated).
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
brew 'coreutils'
# Install some other useful utilities like `sponge`.
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.

brew 'ag'           # prefer ripgrep https://github.com/ggreer/the_silver_searcher
# brew 'apg'          # password generator - see pwgen below
# brew 'autojump'     # prefer jump navigate directories
brew 'aspell'

brew 'bash'
brew 'bat'

brew 'curl',        args: %w[--with-openssl --with-nghttp2]
brew 'coreutils'
brew 'ctags'
brew 'ctop'         # top for docker containers

brew 'diff-so-fancy'
brew 'direnv'

brew 'elixir'
brew 'erlang'
brew 'eza'          # ls replacement

brew 'fd'
brew 'ffmpeg',      args: %w[--with-libvpx --with-libvorbis]
brew 'findutils'
brew 'fzf'          # perfect fuzzy finder :)

brew 'gawk'
brew 'git'
brew 'git-lfs'
brew 'gnu-sed',     args: %w[--with-default-names]
brew 'gnupg2'
brew 'go'           # install gvm
brew 'gpg-agent'
brew 'graphviz'

brew 'heroku-toolbelt'
brew 'heroku-toolbelt'
brew 'highlight'    # http://www.andre-simon.de/doku/highlight/en/highlight.php
brew 'openssh'
brew 'htop'
brew 'httpie'       # better than curl
brew 'hub'

brew 'imagemagick', args: %w[--with-webp]
brew 'ipcalc'

brew 'jq'           # json tool https://stedolan.github.io
brew 'jump'

# kubectx
# kubernetes-cli
# kubetail
# stern
# aws-sam-cli
# awscli

brew 'leiningen'    # Install clojure tools
brew 'links'
brew 'lua'
brew 'luajit'
brew 'lsof'

brew 'moreutils'
cask 'macvim', args: %w[--with-cscope --with-lua --with-override-system-vim --with-luajit --with-python3]
# brew 'vim', args: ['--override-system-vi'] - macvim does this job

brew 'ncdu'         # to free space on disk
# brew 'neovim/neovim/neovim'
brew 'netcat'
# brew 'node'
brew 'nvm'

brew 'openssl'

brew 'pcre'
brew 'pgcli'        # better psql
brew 'proctools'
brew 'protobuf'
brew 'pstree'
brew 'pwgen'        # generate random string eg. pwgen -Bsv1 64
#                   # openssl rand -base64 20
#                   # date +%s | sha256sum | base64 | head -c 64 ; echo
#                   # ruby -e "require 'securerandom'; puts SecureRandom.hex(64)"
brew 'pv'           # http://www.ivarch.com/programs/pv.shtml
brew 'python'
brew 'python3'

brew 'q'            # https://github.com/harelba/q

brew 'ranger'
brew 'rbenv'
brew 'rbenv-default-gems'
brew 'reattach-to-user-namespace'
brew 'ripgrep'
brew 'rpl'          # replace strings recursively http://www.laffeycomputer.com/rpl.html
brew 'ruby-build'   # manage rubies

brew 'shellcheck'   # linter for bash scripts
brew 'sqlite'
brew 'ssh-copy-id'  # macOS >= sierra has it default
brew 'stow'         # for managing dotfiles

brew 'tag-ag'       # https://github.com/aykamko/tag (optionaly sack)
brew 'the_silver_searcher'
brew 'tig'          # git manager
brew 'tldr'
brew 'tmux'
brew 'trash'        # https://github.com/ali-rantakari/trash
brew 'tree'

brew 'universal-ctags', args: %w(HEAD)

brew 'vnstat'

brew 'yarn'

brew 'watch'
brew 'wget',            args: %w(--with-iri)
brew 'wrk'              # HTTP benchmarks https://github.com/wg/wrk

brew 'xz'               # similar to gzip http://tukaani.org/xz/

brew 'zoxide'
brew 'zsh'

# brew 'youtube-dl'     # download from youtube
# heroku update
brew 'redis'            # use docker image
# brew 'elasticsearch'  use docker image
# brew 'mariadb'        use docker image
# brew 'mongodb'        use docker image
# brew 'postgresql'     use docker image
# brew 'rabbitmq'       use docker image

##################################### CASK #####################################
cask_args appdir: '/Applications'
# brew 'caskroom/cask/brew-cask'
cask 'dropbox'
cask 'evernote'
cask 'flux'
cask 'karabiner'
cask 'path-finder'
cask '1password'
cask 'slack'
# cask 'dashlane'
# cask 'spotify'
cask 'iterm2'
cask 'alfred'
# brew cask alfred link
cask 'java'
cask 'joe' # check performance with large files
           # https://github.com/jhallen/joes-sandbox/tree/master/editor-perf
cask 'heroku-toolbelt'
# cask 'charles'
cask 'skype'
cask 'skitch'
# cask 'google-chrome'
cask 'google-drive'
cask 'firefox'
cask 'opera'
cask 'caffeine'
# cask 'utorrent'
cask 'vlc'
cask 'cathode'
cask 'cyberduck'
cask 'atom'
cask 'tower'
cask 'macdown'
cask 'keybase'      # http://keybase.io

# http://freemacsoft.net/appcleaner/

# brew install git-flow
# brew install dark-mode
# brew install rename
# brew install speedtest_cli
# xcode
# thunderbird
# navicat
# kindle
# istat menu
# brackets
#
# #################### CHROME PLUGINS ##########################################
# rails panel
# awesome screenshot
# jsonview
# onetab
# simple web socket client
