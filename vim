#!/bin/bash
if [ ! -f /usr/bin/vim ]
then
    echoNewSegment "Installing"
    yum install -y vim
fi

if [ ! -f /home/vagrant/.vimrc ]; then
    echoNewSegment "Configuring"
    cp ${ROOT}/files/etc/.vimrc /home/vagrant/.vimrc
    chown vagrant:vagrant /home/vagrant/.vimrc
    mkdir -p /home/vagrant/.vim/autoload /home/vagrant/.vim/bundle && \
    echo "Vim :: Pathogen..."
    curl -LSso /home/vagrant/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    cd /home/vagrant/.vim/bundle
    echo "Vim :: Command-P"
    rm -rf command-t
    git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
    echo "Vim :: NERDTree"
    rm -rf nerdtree
    git clone https://github.com/scrooloose/nerdtree.git
    echo "Vim :: NERDTree Tabs"
    rm -rf vim-nerdtree-tabs
    git clone https://github.com/jistr/vim-nerdtree-tabs.git

    echo "Vim :: Molokai Theme"
    rm -rf vim-nerdtree-tabs
    git clone https://github.com/tomasr/molokai

    chown -R vagrant:vagrant /home/vagrant/.vim
fi

