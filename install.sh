#!/usr/bin/env bash
mkdir -p ~/.vim/bundle

cd ~/.vim/bundle

git clone https://github.com/itchyny/lightline.vim.git
git clone https://github.com/nelstrom/vim-visual-star-search.git
git clone https://github.com/romainl/Apprentice.git
git clone https://github.com/sheerun/vim-polyglot.git
git clone https://github.com/tpope/vim-pathogen.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/w0rp/ale.git

ln -sv ~/.dotfiles/.vimrc ~/.vimrc

ln -sv ~/.dotfiles/.gitconfig ~/.gitconfig
