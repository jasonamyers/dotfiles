#!/bin/bash

# Install Homebrew
echo -e "\n>> Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"\

# Install Mac apps
echo -e "\n>> Installing Mac apps via brew cask"
brew cask install 1password google-chrome iterm2 docker spectacle visual-studio-code

# Install brew utils
echo -e "\n>> Installing terminal apps via brew"
brew install ack ctags libyaml libuv neovim/neovim/neovim sqlite redis vim jq zsh git

# Install pyenv
echo -e "\n>> Installing pyenv"
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

# Cloning dotfiles repo
echo -e "\n>> Cloning dotfiles"
git clone https://github.com/jasonamyers/dotfiles.git

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

# Install ZSH
echo -e "\n>> Installing ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install ZSH syntax highlighting
echo -e "\n>> Installing ZSH syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Sourcing zshrc
echo -e "\n>> Sourcing zshrc"
source ~/.zshrc

# Install Python 2 and 3
echo -e "\n>> Installing Python 3"
pyenv install 3.7.6

# Install Vundle
echo -e "\n>> Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# Install vim plugins
echo -e "\n>> Installing VIM plugins"
vim +PluginInstall +qall
