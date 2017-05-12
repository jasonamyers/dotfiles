export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

alias ls='ls -G'
alias ll='ls -hlatr --color'
alias gg='history | grep'
#alias vim='~/Applications/MacVim.app/Contents/MacOS/Vim'
alias breakitdown="history | awk '{a[$2]++ } END{for(i in a){print a[i] ' ' i}}'|sort -rn |head -n 20"
alias cleanpyc='find . -type f -name "*.pyc" -delete'
alias startpost='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppost='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias pms='python manage.py runserver'
alias pmsh='python manage.py shell'
alias pmdb='python manage.py dbshell'


export GIT_EDITOR="vim"
GIT_PS1_SHOWDIRTYSTATE=true
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
export COMMAND_MODE=unix2003
export TM_PYCHECKER=pylint

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export EDITOR="vim"

#borrowed from MITSUHIKO
MY_DEFAULT_COLOR="[00m"
MY_GRAY_COLOR="[37m"
MY_PINK_COLOR="[35m"
MY_GREEN_COLOR="[32m"
MY_ORANGE_COLOR="[33m"
MY_RED_COLOR="[31m"
if [ `id -u` == '0' ]; then
  MY_USER_COLOR=$MY_RED_COLOR
else
  MY_USER_COLOR=$MY_PINK_COLOR
fi

export MY_BASEPROMPT='\e${MY_USER_COLOR}\u\
\e${MY_GRAY_COLOR}@\e${MY_ORANGE_COLOR}\h \
\e${MY_GRAY_COLOR}in \e${MY_GREEN_COLOR}\w\
\e${MY_GRAY_COLOR}$(__git_ps1)\e${MY_DEFAULT_COLOR}'
export PS1="${MY_BASEPROMPT}
$ "
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[ ]*:ls:ll:la:l:cd:pwd:exit:mc:su:df:clear"

export WORKON_HOME=$HOME/.virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/local/Cellar/python/2.7.13/bin/python
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PROJECT_HOME=$HOME/Develop
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias tmux="TERM=screen-256color-bce tmux"

export NVM_DIR="/Users/jmyers/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f /Users/jasonmyers/.travis/travis.sh ] && source /Users/jasonmyers/.travis/travis.sh

source /Users/jasonamyers/functions.sh
source /Users/jasonamyers/liquidprompt/liquidprompt
prompt_tag $PORTRAY_PROMPT
