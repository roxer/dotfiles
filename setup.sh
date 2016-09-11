#!/bin/sh

# install first: homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install oh-my-zsh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

mkdir -p ~/.vim/plugin
ln -s ./vim/abbreviation.vim ~/.vim/plugin/abbreviation.vim
ln -s ./Brewfile             ~/Brewfile
ln -s ./gemrc                ~/.gemrc
ln -s ./irbrc                ~/.irbrc
ln -s ./pryrc                ~/.pryrc
ln -s ./psqlrc               ~/.psqlrc
ln -s ./tmux.conf            ~/.tmux.conf
ln -s ./vim/vimrc            ~/.vimrc
ln -s ./zshrc                ~/.zshrc

brew tap homebrew/bundle
brew bundle

brew link curl --force
brew linkapps macvim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

pip install wharfee

git clone git://github.com/zsh-users/zsh-autosuggestions \
  $ZSH_CUSTOM/plugins/zsh-autosuggestions
