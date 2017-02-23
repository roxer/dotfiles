#!/usr/bin/env bash

# install first: homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install oh-my-zsh
zsh < <(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)

mkdir -p ~/.vim/plugin
ln -sf ./vim/abbreviation.vim ~/.vim/plugin/abbreviation.vim
ln -sf ./Brewfile             ~/Brewfile
ln -sf ./gemrc                ~/.gemrc
ln -sf ./irbrc                ~/.irbrc
ln -sf ./pryrc                ~/.pryrc
ln -sf ./psqlrc               ~/.psqlrc
ln -sf ./tmux.conf            ~/.tmux.conf
ln -sf ./vim/vimrc            ~/.vimrc
ln -sf ./zshrc                ~/.zshrc
ln -sf ./lftprc               ~/.lftprc
ln -sf ./bin/git-churn        /usr/local/bin/

brew tap homebrew/bundle
brew bundle

brew link curl --force
brew linkapps macvim
git lfs install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

pip install wharfee

mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git://github.com/zsh-users/zsh-autosuggestions \
  $ZSH_CUSTOM/plugins/zsh-autosuggestions
# setup config for iTerm2 http://stackoverflow.com/a/25122646/4298624
