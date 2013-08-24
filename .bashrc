#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
alias ipy='ipython'
alias py='python2.7'
alias grep='grep --color=auto'
alias c7='chmod 777 *'

HISTSIZE=50000
HISTFILESIZE=500000
# lots of aliases omitted for the sake of space

red="\[\e[0;33m\]"
yellow="\[\e[0;31m\]"

if [ `id -u` -eq "0" ]; then
    root="${yellow}"
else
    root="${red}"
fi

#PS1='\n\[\e[30;1m\]┌─[\[\e[0m\]\[\e[34;1m\]\u@\h\[\e[0m\]\[\e[30;1m\]]──[\[\e[0m\]\[\e[37;1m\]\w\[\[\e[0m\]\[\e[30;1m\]]\[\[\e[0m\]\n\[\e[30;1m\]└─[\[\e[0m\]\[\e[34;2m\]\D{%d %b} \[\e[30;1m\]■\[\e[0m\] \[\e[34;2m\]\A\[\e[0m\]\[\e[30;1m\]]──■\[\[\e[0m\] '

export PS1='\[\033[0;35m\]┌┼─┼─ \[\033[0m\033[0;35m\]\u\[\033[0m\] @ \[\033[0;33m\]\h\[\033[0m\033[0;35m\] ─┤├─ \[\033[0m\]\t \d\[\033[0;35m\] ─┤├─ \[\033[0;33m\]\w\[\033[0;35m\] ─┤ \n\[\033[0;35m\]└┼─\[\033[0m\033[0;35m\]\$\[\033[0m\033[0;35m\]─┤▶\[\033[0m\] ✭ '

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

export PATH="/usr/lib/cw:$PATH"

export LESSOPEN="| /usr/local/bin/source-highlight-esc.sh %s"
export LESS=' -R '

source /usr/local/bin/virtualenvwrapper.sh


# extract function
extract() {
  if [[ -f $1 ]]; then
case $1 in
      *.7z) 7z x $1;;
      *.bz2) bunzip2 $1;;
      *.gz) gunzip $1;;
      *.rar) unrar x $1;;
      *.tar) tar xvf $1;;
      *.tar.bz2) tar xvjf $1;;
      *.tar.gz) tar xvzf $1;;
      *.tbz2) tar xvjf $1;;
      *.tgz) tar xvzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *) echo "unable to extract '$1'..." ;;
    esac
else
echo "'$1' is not a valid file!"
  fi  
}


shopt -s histappend
export PROMPT_COMMAND='history -a' 


alias src='source ~/.bashrc'
export TERM=xterm


#going to switch my ssh aliases to rely on custom host file that i'll pull from a server via restful api


