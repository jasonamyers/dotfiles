#!/bin/bash
set -x

# Install Homebrew
echo -e "\n>> Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"\

# Install Mac apps
echo -e "\n>> Installing Mac apps via brew cask"
brew cask install bartender spotify 1password google-chrome iterm2 omnigraffle istat-menus pycharm atom paw docker spectacle

# Install brew utils
echo -e "\n>> Installing terminal apps via brew"
brew install ack ctags libyaml libuv neovim/neovim/neovim sqlite tfenv redis vim go jq zsh node@6 git

# Install pyenv 
echo -e "\n>> Installing pyenv"
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

# Cloning dotfiles repo
echo -e "\n>> Cloning dotfiles"
git clone https://github.com/jasonamyers/dotfiles.git
git clone https://github.com/nojhan/liquidprompt.git

# Cloning dotfiles repo
echo -e "\n>> Cleaning up default bash files"
rm -rf ~/.bash*

# Init symlinks for config files
echo -e "\n>> Creating symlinks"
pushd dotfiles
for file in [a-zA-Z]* ; do
    if [[ "$file" != "setup.sh" && "$file" != "README.md" && "$file" != "env" && "$file" != "LICENSE.txt" ]] ; then
        if [[ -h ~/."$file" ]] ; then
            # symlink, remove it since it will be re-created anyway
            echo "  Removing symbolic link ~/.$file"
            rm ~/."$file"
        elif [[ -a ~/."$file" ]] ; then
            # an actual file, create backup
            echo "  ~/.$file exists. Moving it to ~/.$file.backup"
            mv ~/."$file" ~/."$file".backup || echo "  Couldn't move ~/.$file to ~/.$file.backup!"
        fi

        ln -s `pwd`/"$file" ~/."$file" && echo "  Linked ~/.$file to `pwd`/$file" || echo "  Couldn't link ~/.$file to `pwd`/$file!"
    fi
done
popd

# Sourcing bashrc
echo -e "\n>> Sourcing bashrc"
source ~/.bashrc

# Installing Python 2 and 3
echo -e "\n>> Installing Python 2 and 3"
pyenv install 2.7.13
pyenv install 3.6.1

# Building neovim virtualenvs
pyenv virtualenv 2.7.13 neovim2
pyenv virtualenv 3.6.1 neovim3
pyenv activate neovim2
pip install neovim
pyenv activate neovim3
pip install neovim
pip install flake8
ln -s `pyenv which flake8` ~/bin/flake8

# Running osx-for-hackers
echo -e "\n>> Running osx-for-hackers"
~/dotfiles/osx-for-hackers.sh
