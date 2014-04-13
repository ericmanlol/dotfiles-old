#github.com/ericmanlol/dotfiles
#oh-my-zsh:
#https://github.com/robbyrussell/oh-my-zsh
#
#my custom oh-my-zsh theme: woo.zsh.theme
#https://github.com/ericmanlol/oh-my-zsh
#https://github.com/ericmanlol/oh-my-zsh/themes/woo.zsh.theme
#
#based on gourmet copypasta from the net + rapid retard style trial and error
#


#completion:
autoload -U compinit
compinit

#double tizab for menu select
zstyle ':completion:*' menu select

#bindkey to ncurses app
#ncmpcppShow() { BUFFER="ncmpcpp"; zle accept-line; }
#zle -N ncmpcppShow
#bindkey '^[\' ncmpcppShow

#history 
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward


# Path to my oh-my-zsh fork
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="woo"


ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

#List of others I enjoyed
#ZSH_THEME="smt"
#ZSH_THEME="norm"
#ZSH_THEME="jonathan"
#ZSH_THEME="fino-time"
#ZSH_THEME="duellj"
#ZSH_THEME="alanpeabody"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(git zsh-syntax-highlighting)


##envs/jails
source $ZSH/oh-my-zsh.sh

source /home/woo/.nvm/nvm.sh

#source /home/woo/.rvm/scripts/rvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
#

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux



# History; I'm a bit paranoid about history, since there's always
#so much to remember.
##################################################################
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=10000
SAVEHIST=10000
EXTENDED_HISTORY=1
HIST_EXPIRE_DUPS_FIRST=1


# do i need to explicitly declare this still? with inc_append_history set? humm

#setopt extended_history
#setopt hist_expire_dups_first
#setopt hist_verify
# Appends every command to the history file once it is executed
#setopt inc_append_history
# Reloads the history whenever you use it
#setopt share_history

# Grep the history with 'h'
h () { history 0 | grep $1 }
hi () { history | grep -i $1 }



## Misc
#######
#to be tested
## smart urls
#autoload -U url-quote-magic
#zle -N self-insert url-quote-magic
## file rename magick
#bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs




# extract function
# deprecated a bit due to -xvf being magical
#=====================================================================
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

# dirstack handling {{{

DIRSTACKSIZE=${DIRSTACKSIZE:-20}
DIRSTACKFILE=${DIRSTACKFILE:-${HOME}/.zdirs}

if [[ -f ${DIRSTACKFILE} ]] && [[ ${#dirstack[*]} -eq 0 ]] ; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    # "cd -" won't work after login by just setting $OLDPWD, so
    [[ -d $dirstack[0] ]] && cd $dirstack[0] && cd $OLDPWD
fi

chpwd() {
    local -ax my_stack
    my_stack=( ${PWD} ${dirstack} )
    #if is42 ; then
        builtin print -l ${(u)my_stack} >! ${DIRSTACKFILE}
    #else
    #    uprint my_stack >! ${DIRSTACKFILE}
    #fi
}

# }}}


# Determine a directory sizes {{{
dirsize() {
    du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
    egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list &> /dev/null
}

# }}}

#- Define a word - USAGE: define dog
define() {
    lynx -dump "http://www.google.com/search?hl=en&q=define%3A+${1}&btnG=Google+Search" | grep -m 3 -w "*"  | sed 's/;/ -/g' | cut -d- -f1 > /tmp/templookup.txt
    if [[ -s  /tmp/templookup.txt ]] ;then
        until ! read response
        do
            echo "${response}"
        done < /tmp/templookup.txt
    else
        echo "Sorry, I can't find the term \"${1} \""
    fi
    rm -f /tmp/templookup.txt > /dev/null
}



#python virtualenv
#=====================================================================
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/.pdevel
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_HOOK_DIR=/home/woo/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# GIT ALIASES
#=====================================================================
alias g=git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
#alias gl='git pull'
alias gp='git push'
alias gpom='git push origin master'
alias gst='git status -sb'
alias gsd='git svn dcommit'
alias gsr='git svn rebase'
alias gs='git stash'
alias gsa='git stash apply'
alias gr='git stash && git svn rebase && git svn dcommit && git stash pop' # git refresh
alias gd='git diff | $GIT_EDITOR -'
alias gmv='git mv'
alias gho='$(git remote -v 2> /dev/null | grep github | sed -e "s/.*git\:\/\/\([a-z]\.\)*/\1/" -e "s/\.git$//g" -e "s/.*@\(.*\)$/\1/g" | tr ":" "/" | tr -d "\011" | sed -e "s/^/open http:\/\//g")'

#commits gc(x);
alias gcm='git commit -m'
alias gc='git commit -v'

# dir colors (going give solarized a whirl)
# fyi: https://raw2.github.com/seebi/dircolors-solarized/master/dircolors.256dark
#=====================================================================
eval `dircolors /home/woo/.dircolors`

#dircolors on tab completion
#https://github.com/robbyrussell/oh-my-zsh/issues/1563
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 


#grunt tab compl
eval "$(grunt --completion=zsh)"



#ruby aliases
#=====================================================================
# alias b="bundle"
# alias rk='rake'
# alias m='migrate'


#general/misc aliases
#=====================================================================
alias ls='ls --color=always'
alias ll='ls -alh'


#avoiding the 'screen-256color' unknown terminal type
#=====================================================================
alias ssh='TERM=xterm ssh'

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"


alias fuckitYOLO='git commit -am "DEAL WITH IT" && git push -f origin master'

alias sc='systemctl'
