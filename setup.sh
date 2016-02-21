#!/bin/sh

# install first: homebrew
ln -s ./zshrc ~/.zshrc
ln -s ./vim/vimrc ~/.vimrc
ln -s ./Brewfile ~/Brewfile
ln -s ./irbrc ~/.irbrc
ln -s ./pryrc ~/.pryrc
ln -s ./psqlrc ~/.psqlrc
ln -s ./tmux.conf ~/.tmux.conf
ln -s ./gemrc ~/.gemrc
mkdir -p ~/.vim/plugin
ln -s ./vim/abbreviation.vim ~/.vim/plugin/abbreviation.vim

brew tap homebrew/bundle
brew bundle

number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))
