export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export TERM=xterm-color

alias ls='ls -G'
alias ll='ls -hlatr'
alias gg='history | grep'
#alias vim='~/Applications/MacVim.app/Contents/MacOS/Vim'
alias breakitdown="history | awk '{a[$2]++ } END{for(i in a){print a[i] ' ' i}}'|sort -rn |head -n 20"
alias cleanpyc='find . -type f -name "*.pyc" -delete'
alias startpost='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppost='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias pms='python manage.py runserver'
alias pmsh='python manage.py shell'
alias pmdb='python manage.py dbshell'


export GIT_EDITOR="nvim"
GIT_PS1_SHOWDIRTYSTATE=true
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
export COMMAND_MODE=unix2003
export TM_PYCHECKER=pylint

export EDITOR="nvim"

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

export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PROJECT_HOME=$HOME/dev
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv virtualenvwrapper_lazy

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias tmux="TERM=screen-256color-bce tmux"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f /Users/jasonmyers/.travis/travis.sh ] && source /Users/jasonmyers/.travis/travis.sh

source $HOME/liquidprompt/liquidprompt
prompt_tag $PORTRAY_PROMPT

[[ -s "/home/jasonamyers/.gvm/scripts/gvm" ]] && source "/home/jasonamyers/.gvm/scripts/gvm"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# List of accounts to read the last tweet from, comma separated
# The first in the list is read by the party parrot.
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'

# Use this to have a different animal say a message in the big box.
export TTC_SAY_BOX='minions'

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS='~/dev'

# The max directory-depth to look for git repositories in
# the directories defined with `TTC_REPOS`. Note that the deeper
# the directory depth, the slower the results will be fetched.
export TTC_REPOS_DEPTH=2

# Which method is to be used to read the git commits ('gitstandup' | 'gitlog').
# If you're having problems seeing your commits in the dahsboard, set
# this value to gitlog.
export TTC_GITBOT='gitlog'

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# _should_ be ok (the zip code doesn't always work -- use a location
# first, if you can). It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER='37128'

# Set to false if you're an imperial savage. <3
export TTC_CELSIUS=False

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=true

# Refresh the dashboard every 20 minutes.
export TTC_UPDATE_INTERVAL=20

# Turn off terminal title
export TTC_TERMINAL_TITLE=false

# Twitter api keys
export TTC_CONSUMER_KEY='lxJl2n7KdB5pIET1ejfsgiAG7'
export TTC_CONSUMER_SECRET='NRu91gJ5OJTU8JqqgsrTy01jqpydVMgxxZCmD5gloDzBfIuwxa'
export TTC_ACCESS_TOKEN='13553-Fv9nBr1VKPkjOreBfbSzxqcjde5GlBZF2NOtkVFFZCUj'
export TTC_ACCESS_TOKEN_SECRET='LBd0KPn8r9RZdI8E6cbeEnyiQAgEOtaB9jacOb8WnJ8eW'

# added by travis gem
[ -f /home/jasonamyers/.travis/travis.sh ] && source /home/jasonamyers/.travis/travis.sh
