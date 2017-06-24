#!/bin/bash

# Install PreReqs
echo -e "\n>> Installing PreReqs"
sudo apt-get install -y git vim make gnome-tweak-tool curl build-essential libssl-dev \
    zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget llvm libncurses5-dev \
    mercurial binutils bison gcc terminator thunar ranger htop cmatrix neofetch redshift \
    rofi compton scrot feh maim dunst lxappearance git slop cmake libxcb1-dev \
    libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
    libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev \
    libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf \
    libxcb-xrm0 libxcb-xrm-dev pkg-config libxcb1 libpam-dev libcairo-dev \
    libxcb-composite0 libxcb-composite0-dev libxcb-xinerama0-dev libev-dev libx11-dev \
    libx11-xcb-dev libxkbcommon0 libxkbcommon-x11-0 libxcb-dpms0-dev libxcb-image0-dev \
    libxcb-util0-dev libxcb-xkb-dev libxkbcommon-x11-dev libxkbcommon-dev imagemagick bash \
    awk utils-linux libdbus-1-dev libx11-dev libxrandr-dev libxss-dev libglib2.0-dev \
    libpango1.0-dev libgtk2.0-dev libxdg-basedir-dev feh i3

sudo apt autoremove -y

echo -E "\n>> I3-gaps"
git clone https://www.github.com/Airblader/i3 /tmp/i3-gaps
cd /tmp/i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

echo -E "\n>> I3 fancy lock"
git clone https://github.com/meskarune/i3lock-fancy /tmp/i3lock-fancy
sudo cp -R /tmp/i3lock-fancy/lock /tmp/i3lock-fancy/icons /usr/local/bin

echo -E "\n>> I3 dunst"
git clone https://github.com/dunst-project/dunst.git /tmp/dunst
cd /tmp/dunst
make
sudo make PREFIX=/usr install


# Install pyenv
echo -e "\n>> Installing pyenv"
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

# Install tfenv
echo -e "\n>> Installing tfenv"
git clone https://github.com/kamatama41/tfenv.git ~/.tfenv
sudo ln -s ~/.tfenv/bin/* /usr/local/bin
tfenv install 0.8
tfenv install 0.9

# Cloning dotfiles repo
echo -e "\n>> Cloning dotfiles"
git clone https://github.com/jasonamyers/dotfiles.git
git clone https://github.com/nojhan/liquidprompt.git

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

# Installing GVM
echo -e "\n>> Installing GVM (Golang) and GOLANG 1.8"
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source /home/jasonamyers/.gvm/scripts/gvm
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.8


# Installing Portray
echo -e "\n>> Installing Portray"
sudo curl -o /usr/local/bin/portray -L https://github.com/jasonamyers/portray/releases/download/v0.2/portray
sudo chmod a+x /usr/local/bin/portray

echo -e "\n>> Initializing Fonts"
fc-cache

echo -e "\n>> Installing NVM (Node) and NodeJS "
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
nvm install v6.11
