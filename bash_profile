source ~/.bashrc

export PATH=/usr/local/Cellar/python/2.7.3/bin:/usr/local/share/python:/usr/local/bin:$PATH:~/bin:/usr/local/sbin:$HOME/.rbenv/bin

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
[ -r "$file" ] && source "$file"
done
unset file

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s /Users/jasonamyers/.nvm/nvm.sh ]] && . /Users/jasonamyers/.nvm/nvm.sh # This loads NVM
