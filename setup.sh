#!/bin/bash
echo ">> Initialising git submodules"
git submodule init
git submodule update

# Init symlinks for config files
echo -e "\n>> Creating symlinks"
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

# Init vim bundles
echo ">> Install vim bundles"
cd ~/.vim/bundle/
./bundles.sh

echo ">> Install Emacs config"
curl -L https://github.com/jasonamyers/prelude/raw/master/utils/installer.sh | sh

echo "Remember to run M-x jedi:install-server in Emacs"

