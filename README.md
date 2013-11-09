# JAM dotfiles

This is my collection of dot files for my mac systems.
They are HIGHLY OPINIONATED!

To use them:

* git clone it into your home directory
* rename your current .bash_profile .bashrc .vim .vimrc
Setup the links
ln -s ~/Dropbox/ssh .ssh
chmod 600 .ssh/*
ln -s ~/dotfiles/bash_profile .bash_profile
ln -s ~/dotfiles/bashrc .bashrc
ln -s ~/dotfiles/vimfolder .vim
ln -s ~/dotfiles/vimrc .vimrc
ln -s ~/dotfiles/oh-my-zsh .oh-my-zsh
ln -s ~/dotfiles/zshrc .zshrc
ln -s ~/dotfiles/zsh .zsh
ln -s ~/dotfiles/jshintrc .jshintrc
ln -s ~/dotfiles/pdbrc .pdbrc
ln -s ~/dotfiles/psqlrc .psqlrc
ln -s ~dotfiles/gitconfig .gitconfig


## Setup Oh-My-Zsh Submodule
* cd dotfiles
* git submodule init
* git submodule update

You might also need the following first:

## Homebrew
* ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
* brew doctor
* brew install git bash-completion python zsh vim cowsay

## Setup ZSH
* Add /usr/local/bin/zsh to /etc/shells
* chsh -s /usr/local/bin/zsh

## Setup VIM
* git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
* open vim
* :BundleInstall

## Setup Virtualenvwrapper
* [See this gist](https://gist.github.com/jasonamyers/6076293)

## Setup JShint for Syntastics Javascript support

1. curl https://raw.github.com/creationix/nvm/master/install.sh | sh
2. npm install -g jshint
