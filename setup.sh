#!/usr/bin/env bash

# http://tech.lauritz.me/caps-lock-as-control-escape/
# install first: homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p ~/.vim/plugin
mkdir -p ~/.zsh
ln -sf $(pwd)/vim/abbreviation.vim  ~/.vim/plugin/abbreviation.vim
ln -sf $(pwd)/Brewfile              ~/Brewfile
ln -sf $(pwd)/gemrc                 ~/.gemrc
ln -sf $(pwd)/irbrc                 ~/.irbrc
ln -sf $(pwd)/pryrc                 ~/.pryrc
ln -sf $(pwd)/psqlrc                ~/.psqlrc
ln -sf $(pwd)/tmux.conf             ~/.tmux.conf
ln -sf $(pwd)/vim/vimrc             ~/.vimrc
ln -sf $(pwd)/zshrc                 ~/.zshrc
ln -sf $(pwd)/lftprc                ~/.lftprc
ln -sf $(pwd)/zsh/aliases.zsh       ~/.zsh/aliases.zsh
ln -sf $(pwd)/zsh/abbreviations.zsh ~/.zsh/abbreviations.zsh
ln -sf $(pwd)/zsh/functions.zsh     ~/.zsh/functions.zsh
ln -sf $(pwd)/bin/git-churn         /usr/local/bin/

brew tap homebrew/bundle
brew bundle

brew link curl --force
brew linkapps macvim
git lfs install
/usr/local/opt/fzf/install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

pip3 install wharfee

# powerline fonts
git clone https://github.com/powerline/fonts.git ~/src
pip install --user git+git://github.com/powerline/powerline
# from powerline repo manually install font Meslo 

cd ~/.oh-my-zsh/themes && wget https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme
mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git://github.com/zsh-users/zsh-autosuggestions \
  $ZSH_CUSTOM/plugins/zsh-autosuggestions
# setup config for iTerm2 http://stackoverflow.com/a/25122646/4298624
