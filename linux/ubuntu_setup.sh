#!/usr/bin/env bash

# for UBUNTU 20.04LTS
# includes:
# - ZSH with zsh syntax highlighting
# - docker setup
# - ripgrep with tag-ag
# - fzf (enhance Ctrl-r, e.g. use: cd **<TAB> )
# - jump
# - ranger
# - direnv
# - q "text as data"
# - jq json parser https://stedolan.github.io/jq/
# - wharfee (docker CLI)
# - ctop (top for docker)
# - pgcli (postgres CLI)

# sudo add-apt-repository --remove ppa:jonathonf/vim
sudo add-apt-repository -yu ppa:neovim-ppa/unstable
sudo add-apt-repository -yu ppa:git-core/ppa
# for vim 8 + python
# sudo add-apt-repository -yu ppa:pi-rho/dev

sudo apt update -yqqu
sudo apt install -y libz-dev make autoconf yodl libncursesw5-dev texinfo libevent-dev \
                    libncurses-dev bison golang libreadline-dev libpq-dev \
                    build-essential \
                    libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip \
                    apt-transport-https ca-certificates pkg-config ttf-ancient-fonts \
                    automake libpcre3-dev zlib1g-dev liblzma-dev \
                    software-properties-common gnupg-agent \
                    python3-pip cmake exuberant-ctags checkinstall \
                    libncurses5-dev python-dev python3-dev ruby-dev \
                    lua5.3 liblua5.3-dev libperl-dev geoip-bin libgeoip-dev \
                    libpng-dev libjpeg-dev libxml2-dev libjbig-dev libbz2-dev libfontconfig-dev libfreetype-dev # to build ImageMagick

sudo apt install -y git tree htop ncdu \
                    shellcheck curl \
                    links jq lftp highlight stow \
                    network-manager

export INSTALL_RUBY='3.0.3'
export INSTALL_GO='1.17.5'
export INSTALL_CTOP='0.7.6'
export INSTALL_BAT='0.18.3'
export INSTALL_FD='8.3.0'
# go install - export INSTALL_TAG_AG='1.4.0' # https://github.com/aykamko/tag
export INSTALL_Q='3.1.6'
export INSTALL_CURL='7.80.0'
export INSTALL_DIRENV='2.29.0'
# wget https://github.com/direnv/direnv/releases/download/$INSTALL_DIRENV/direnv.linux-amd64
export INSTALL_TMUX='3.2a'
# wget https://github.com/tmux/tmux/releases/download/${INSTALL_TMUX}/tmux-${INSTALL_TMUX}.tar.gz
export INSTALL_FZF='0.28.0'
# wget https://github.com/junegunn/fzf/archive/$INSTALL_FZF.tar.gz
export INSTALL_JUMP='0.40.0'

# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-from-a-package
# export INSTALL_DOCKER_COMPOSE='1.27.4' - install by pip3
# wget https://github.com/docker/compose/releases/download/$INSTALL_DOCKER_COMPOSE/docker-compose-Linux-x86_64

# git config --global user.email "deploy@hattec.com"
# git config --global user.name "Deploy MW"
# git config comes from ~/.gitconfig (see below)

# #############################################################################
#   JUMP
# #############################################################################
wget https://github.com/gsamokovarov/jump/releases/download/v${INSTALL_JUMP}/jump_${INSTALL_JUMP}_amd64.deb \
  && sudo dpkg -i jump_${INSTALL_JUMP}_amd64.deb

# #############################################################################
#   PYTHON PIP
# #############################################################################
pip3 install --upgrade pip
# pip3 install virtualenv
# source ~/venv/bin/activate
# docker CLI in python
# sudo pip3 install wharfee # TODO: incompatible with pgcli
# sudo chown $(whoami):$(whoami) /usr/local/bin/wharfee
sudo pip3 install pgcli
sudo pip3 install httpie
sudo pip3 install docker-compose
sudo pip3 install awscli
sudo pip3 install awscli-plugin-endpoint

# #############################################################################
#   GO LANG
# #############################################################################
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source /home/$(whoami)/.gvm/scripts/gvm
gvm install go${INSTALL_GO} -B
gvm use     go${INSTALL_GO} --default
# #############################################################################
#   TAG-AG
#   https://github.com/aykamko/tag
# #############################################################################
go get -u github.com/aykamko/tag/...
go install github.com/aykamko/tag@latest

# #############################################################################
#   Rust + ripgrep
# #############################################################################
# ## rust lang and ripgrep (better than grep and silver searcher)
# ## warning: takes > 3min
curl https://sh.rustup.rs -sSf | sh
source ~/.cargo/env && cargo install ripgrep

# #############################################################################
#   RUBY
# #############################################################################
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init --no-rehash - bash)"' >> ~/.profile
source ~/.profile
rbenv install $INSTALL_RUBY
rbenv rehash
rbenv global $INSTALL_RUBY
gem i -N bundler
gem i -N pry
gem i -N tmuxinator

# #############################################################################
#   DOCKER
# #############################################################################
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $(whoami)
# sudo gpasswd -a deploy docker

# #############################################################################
#   DIRENV
# #############################################################################
curl -sfL https://direnv.net/install.sh | bash

# #############################################################################
#   CTOP for Docker
# #############################################################################
sudo wget https://github.com/bcicen/ctop/releases/download/v${INSTALL_CTOP}/ctop-${INSTALL_CTOP}-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop

# zsh from source is bellow
# sudo apt install zsh
sudo apt -y remove tmux
sudo apt -y autoremove

mkdir -p ~/src

# #############################################################################
#   TMUX
# #############################################################################
mkdir -p ~/.tmux/plugins
wget https://github.com/tmux/tmux/releases/download/${INSTALL_TMUX}/tmux-${INSTALL_TMUX}.tar.gz
tar xvf tmux-${INSTALL_TMUX}.tar.gz
cd tmux-${INSTALL_TMUX} && ./configure && make && sudo make install

# #############################################################################
#   RANGER
# #############################################################################
git clone https://github.com/ranger/ranger.git ~/src/ranger
cd ~/src/ranger && sudo python3 setup.py install --optimize=1 --record=install_log.txt
ranger --copy-config=scope

# #############################################################################
#   BAT
#   https://github.com/sharkdp/bat
# #############################################################################
cd ~/src && wget https://github.com/sharkdp/bat/releases/download/v${INSTALL_BAT}/bat_${INSTALL_BAT}_amd64.deb
sudo dpkg -i bat_${INSTALL_BAT}_amd64.deb

# #############################################################################
#   FD
#   https://github.com/sharkdp/fd
# #############################################################################
cd ~/src && wget https://github.com/sharkdp/fd/releases/download/v${INSTALL_FD}/fd_${INSTALL_FD}_amd64.deb
sudo dpkg -i fd_${INSTALL_FD}_amd64.deb

# #############################################################################
#   TIG (git client)
# #############################################################################
git clone https://github.com/jonas/tig.git ~/src/tig
cd ~/src/tig && make && make install

cd ~/src && wget https://github.com/harelba/q/releases/download/${INSTALL_Q}/q-text-as-data_${INSTALL_Q}-2_amd64.deb
sudo dpkg -i q-text-as-data_${INSTALL_Q}-2_amd64.deb

# #############################################################################
#   ZSH
# #############################################################################
git clone https://github.com/zsh-users/zsh.git ~/src/zsh
echo "/usr/bin/zsh" | sudo tee -a /etc/shells
cd ~/src/zsh || exit

./Util/preconfig
./configure --prefix=/usr         \
            --bindir=/usr/bin     \
            --sysconfdir=/etc/zsh \
            --enable-etcdir=/etc/zsh
make
# do not install doc - remove parts from makefile
sed -i '66s/^.*$/install: install.bin install.modules install.fns/' Makefile.in
sudo make install
sudo usermod -s `which zsh` $(whoami)

cd ~/src && curl -fsOL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
bash ./install.sh
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/djui/alias-tips ~/.oh-my-zsh/custom/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cd ~/.oh-my-zsh/themes && wget https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme

ln -sf /opt/dotfiles/linux/config/zsh/zshrc ~/.zshrc
ln -sf /opt/dotfiles/linux/config/vim/vimrc ~/.vimrc
ln -sf /opt/dotfiles/linux/config/tmux/*.yml ~/.tmuxinator/
mkdir -p ~/.vim
ln -sf /opt/dotfiles/linux/config/vim/vimrc ~/.vim/init.vim
ln -sf /opt/dotfiles/linux/config/gitconfig ~/.gitconfig
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash
zsh
source ~/.zshrc

# #############################################################################
#   NODE
# #############################################################################
nvm install node
npm install -g diff-so-fancy

# #############################################################################
#   YARN
# #############################################################################

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install -y --no-install-recommends yarn

# #############################################################################
#   FZF
# #############################################################################
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install

# #############################################################################
#   cUrl
# #############################################################################
cd ~/src || exit
wget http://curl.haxx.se/download/curl-${INSTALL_CURL}.tar.bz2 && tar xjf curl-${INSTALL_CURL}.tar.bz2
cd curl-${INSTALL_CURL}
./configure --with-openssl --with-gnutls
make
sudo make install
sudo ldconfig
sudo apt -y remove curl

# #############################################################################
#   ImageMagick
# #############################################################################
wget https://www.imagemagick.org/download/ImageMagick.tar.gz
# sudo apt install libpng-dev libjpeg-dev libxml2-dev libjbig-dev libbz2-dev libfontconfig-dev libfreetype-dev
tar xvzf ImageMagick.tar.gz
cd ImageMagick-7.0.fixme
./configure
make
sudo make install
sudo ldconfig /usr/local/lib

# #############################################################################
#   Let's Encrypt
# #############################################################################
# https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04
https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04
sudo apt install certbot python3-certbot-nginx

sudo ufw allow 'Nginx Full'
sudo ufw allow 'OpenSSH'
sudo ufw enable

######## OPTIONAL #########

: <<'END'
# #############################################################################
#   VIM 8.2 + plugins
# #############################################################################
git clone https://github.com/vim/vim.git ~/src/vim
cd ~/src/vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-cscope \
            --enable-rubyinterp=yes \
            --enable-perlinterp=yes \
            --enable-python3interp=yes \
            --enable-largefile \
            --enable-luainterp=yes \
            --with-luajit

            # --enable-pythoninterp=dynamic \
            # --enable-python3interp \
            # --with-python3-config-dir=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu \

make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
# sudo checkinstall
sudo make install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -> :PlugInstall
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer
END
