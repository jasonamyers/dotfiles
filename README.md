# JAM dotfiles

This is my collection of dot files for my mac systems.
They are HIGHLY OPINIONATED!

To use them:

* git clone it into your home directory
* rename your current .bash_profile .bashrc .vim .vimrc
* ln -s ~/dotfiles/bash_profile .bash_profile
* ln -s ~/dotfiles/bashrc .bashrc
* ln -s ~/dotfiles/vimfolder .vim
* ln -s ~/dotfiles/vimrc .vimrc
* ln -s ~/dotfiles/oh-my-zsh .oh-my-zsh
* ln -s ~/dotfiles/zshrc .zshrc
* ln -s ~/dotfiles/zsh .zsh

## Setup Oh-My-Zsh Submodule
* cd dotfiles
* git submodule init
* git submodule update


You might also need the following first:

## Homebrew
* ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
* brew doctor
* brew install git bash-completion python zsh

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

1. Install [Node.js](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager).
2. Globally install [JSHint](http://jshint.com/install/).
3. Place [.jshintrc](http://www.jshint.com/docs/#config) into your `~`, optionally place it into your project directory.

## Setup CoVim
* pip install twisted

## Configure Git
* git config --global color.ui auto
* git config --global core.autocrlf input
* git config --global user.name "Jason Myers"
* git config --global user.email "jason@jasonamyers.com"
* git config --global core.excludesfile "~/.gitignore"
* add .DS_Store and thumbs.db to that file
* git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all"
* git config --global alias.pu !"git fetch origin -v; git fetch upstream -v; git merge upstream/master"
  * Pay Attention to the !" some terms will make it !
* git config --global github.user jasonamyers
