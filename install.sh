#!/usr/bin/env bash
mkdir -p ~/.vim/bundle

cd ~/.vim/bundle

if [ ! -d ~/.vim/bundle/lightline.vim ]; then
  git clone https://github.com/itchyny/lightline.vim.git
fi

if [ ! -d ~/.vim/bundle/vim-visual-star-search ]; then
  git clone https://github.com/nelstrom/vim-visual-star-search.git
fi

if [ ! -d ~/.vim/bundle/Apprentice ]; then
  git clone https://github.com/romainl/Apprentice.git
fi

if [ ! -d ~/.vim/bundle/vim-polyglot ]; then
  git clone https://github.com/sheerun/vim-polyglot.git
fi

if [ ! -d ~/.vim/bundle/vim-pathogen ]; then
  git clone https://github.com/tpope/vim-pathogen.git
fi

if [ ! -d ~/.vim/bundle/vim-surround ]; then
  git clone https://github.com/tpope/vim-surround.git
fi

if [ ! -d ~/.vim/bundle/ale ]; then
  git clone https://github.com/w0rp/ale.git
fi

if [ ! -L ~/.vimrc ]; then
  [ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.bak
  ln -sv ~/.dotfiles/.vimrc ~/.vimrc
fi

if [ ! -L ~/.gitconfig ]; then
  [ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.bak
  ln -sv ~/.dotfiles/.gitconfig ~/.gitconfig
fi

if [ ! -L ~/.bash_profile ]; then
  [ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.bash_profile.bak
  ln -sv ~/.dotfiles/.bash_profile ~/.bash_profile
  . ~/.bash_profile
fi

if [ ! -L ~/.bashrc ]; then
  [ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
  ln -sv ~/.dotfiles/.bashrc ~/.bashrc
  . ~/.bashrc
fi

if [ ! -L ~/.screenrc ]; then
  [ -f ~/.screenrc ] && mv ~/.screenrc ~/.screenrc.bak
  ln -sv ~/.dotfiles/.screenrc ~/.screenrc
fi

if [ ! -L ~/.eslintrc ]; then
  [ -f ~/.eslintrc ] && mv ~/.eslintrc ~/.eslintrc.bak
  ln -sv ~/.dotfiles/.eslintrc ~/.eslintrc
fi
