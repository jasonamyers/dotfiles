# Set custom prompt
setopt PROMPT_SUBST
autoload -U promptinit
promptinit
prompt grp
# unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"

export DEFAULT_USER="jasonmyers"
export ZSH_POWERLINE_SHOW_USER="false"
export ZSH_POWERLINE_SHOW_IP="false"
export ZSH_POWERLINE_SINGLE_LINE="true"
export PGHOST=localhost
export NOSE_REDNOSE=1
autoload -U compinit
compinit -u

alias ls='ls -G'
alias ll='ls -hlatr --color'
alias lf="ls -l | egrep -v '^d'"
alias ldir="ls -l | egrep '^d'"
alias gg='history | grep'
alias breakitdown="history | awk '{a[$2]++ } END{for(i in a){print a[i] ' ' i}}'|sort -rn |head -n 20"
alias cleanpyc='find . -type f -name "*.pyc" -delete'
alias startpost='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppost='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias startmongo="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
alias cleanup='git branch --merged | grep -v master | grep -v "*" | cut -c3- | xargs -I {} git branch -d {}'
alias glist='for ref in $(git for-each-ref --sort=-committerdate --format="%(refname)" refs/heads/ refs/remotes ); do git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset%n" | cat ; done | awk '"'! a["'$0'"]++'"
alias pmr='python manage.py runserver'
alias pmshell='python manage.py shell'
alias pmdb='python manage.py dbshell'
alias md='mkdir -p'
alias rd='rmdir'
alias d='dirs -v'
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff -w "$@" | vim'
alias gc='git commit -v'
alias gca='git commit -va'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias fruitionwork='tmuxinator start fruition'
alias infrawork='tmuxinator start infrastructure'
alias cataloguework='tmuxinator start fruition'
alias juicecliwork='tmuxinator start juicecli'
alias juicepublicwork='tmuxinator start juicepublicapi'
alias startred='redis-server /usr/local/etc/redis.conf &'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export EDITOR="vim"
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[ ]*:ls:ll:la:l:cd:pwd:exit:mc:su:df:clear"
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/lib/go-1.9/bin
export PATH=$PATH:/Library/TeX/texbin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv virtualenvwrapper
# export PATH="$HOME/.rbenv/bin:$PATH"
# export PIP_VIRTUALENV_BASE=$WORKON_HOME
# export PIP_RESPECT_VIRTUALENV=true
# export PROJECT_HOME=$HOME/dev
#
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias tmux="TERM=screen-256color-bce tmux"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)

export ACK_COLOR_MATCH='red'

source ~/.zsh/func/color_cmds
source ~/.zsh/func/pipp
source ~/.zsh/func/somafm
source ~/.zsh/func/gerritsetup
source ~/.zsh/func/get_mfa_session
source ~/.zsh/func/dinspect
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
#source ~/.nvm/nvm.sh
#nvm use 0.12
# Customize to your needs...
alias ssh=color-ssh
alias pmr=color-pmr
alias pg=color-psql
alias gerritsetup=run_gerritsetup
function colorcode () { highlight -O rtf $* --font Source\ Code\ Pro --style andes --src-lang python --font-size 36 | pbcopy }
alias dinspect=docker_inspect_name

# added by travis gem
[ -f /Users/jasonmyers/.travis/travis.sh ] && source /Users/jasonmyers/.travis/travis.sh

# Handle keybinding issues
bindkey -e
bindkey '^R' history-incremental-search-backward

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_portray virtualenv context dir vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_CUSTOM_PORTRAY="echo $PORTRAY_PROMPT"
POWERLEVEL9K_CUSTOM_PORTRAY_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_PORTRAY_BACKGROUND="red"
POWERLEVEL9K_CUSTOM_PORTRAY_ICON=FREEBSD_ICON
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
