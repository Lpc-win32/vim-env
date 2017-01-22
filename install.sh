#!/bin/bash

set -x

mkdir -p ~/.vim/bundle

cp -r colors ~/.vim

if [ -f ~/.vimrc ] then
	mv ~/.vimrc ~/.vimrc_
fi

cp ./.vimrc ~

echo 'next step will expend long time, please wait'

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall'

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

echo 'vim-env is ok, good luck!'
