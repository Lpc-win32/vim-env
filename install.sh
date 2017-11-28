#!/bin/bash

set -x

mkdir -p ~/.vim/bundle

cp -r colors ~/.vim

if [ -f ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc_
fi

cp ./vimrc ~/.vimrc

echo 'next step will expend long time, please wait'

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall -c quitall

cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer

cd -
cp -f ./ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py

ldconfig

echo 'vim-env is ok, good luck!'
