#github.com/ericmanlol/dotfiles
#
#my custom oh-my-zsh theme: woo.zsh.theme
#https://github.com/ericmanlol/oh-my-zsh
#https://github.com/ericmanlol/oh-my-zsh/themes/woo.zsh.theme
#


#completion:
autoload -U compinit
compinit

#double tizab for menu select
zstyle ':completion:*' menu select

#history 
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward


# Path to my oh-my-zsh fork
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="woo"


ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"


[[ -d $HOME/.bin ]] && export PATH=$PATH:$HOME/.bin


COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(git zsh-syntax-highlighting)


##envs/jails
source $ZSH/oh-my-zsh.sh
source /home/woo/.nvm/nvm.sh

#source /home/woo/.rvm/scripts/rvm
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
#

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux



export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')


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

##interactive comments
setopt interactivecomments # pound sign in interactive prompt






#python virtualenv
#=====================================================================
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/.pdevel
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_HOOK_DIR=/home/woo/.virtualenvs/bin
source /usr/local/bin/virtualenvwrapper.sh

export PIP_VIRTUALENV_BASE=$WORKON_HOME
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# ALIASES
#=====================================================================

#general
alias l='ls --color=always'
alias ls='ls --color=always'
alias ll='ls -alh'
alias svim='vim -u ~/ .vimrc_simple'
alias psef='ps -ef | grep'
alias psg='ps -ef | grep -i'
alias nspln='netstat -plaunt'

#globals
alias -g G='| grep'
alias -g GV='| grep -v'
alias -g W='| wc'
alias -g T="| tail"
alias -g P='-- help | less'
alias -g VZ='vim ~/.zshrc'
alias -g DS='dotfiles --sync'
alias -g VS='source ~/.zshrc'

#python
alias ipy='ipython --profile='woo''


#better jobs #microeconmics (sorry bad joke)
alias j='jobs -l'

# Grep the history with 'h'
h () { history }
hi () { history | grep -i $1 }



#git
alias g=git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gbv='git branch -v'
alias gru='git remote update'
alias gp='git push'
alias gpom='git push origin master'
alias gpu='git push -u'

# alias gst='git status -sb'
alias gst='git status'
alias gs='git status'
alias gsa='git stash apply'
alias gr='git stash && git svn rebase && git svn dcommit && git stash pop' # git refresh
alias gd='git diff | $GIT_EDITOR -'
alias gmv='git mv'
alias gho='$(git remote -v 2> /dev/null | grep github | sed -e "s/.*git\:\/\/\([a-z]\.\)*/\1/" -e "s/\.git$//g" -e "s/.*@\(.*\)$/\1/g" | tr ":" "/" | tr -d "\011" | sed -e "s/^/open http:\/\//g")'

#commits gc(x);
alias gcm='git commit -m'
alias gc='git commit -v'

# git log color hotness
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"

#ruby aliases
#=====================================================================
# alias b="bundle"
# alias rk='rake'
# alias m='migrate'


#avoiding the 'screen-256color' unknown terminal type
#=====================================================================
alias ssh='TERM=xterm ssh'


alias sc='systemctl'




# dir colors
# fyi: https://raw2.github.com/seebi/dircolors-solarized/master/dircolors.256dark
#=====================================================================
eval `dircolors /home/woo/.dircolors`

#dircolors on tab completion
#https://github.com/robbyrussell/oh-my-zsh/issues/1563
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 


#grunt tab compl
eval "$(grunt --completion=zsh)"

#backup file
buf () {
    oldname=$1; 
    if [ "$oldname" != "" ]; 
    then datepart=$(date +%Y-%m-%d); 
    firstpart=`echo $oldname | cut -d "." -f 1`; 
    newname=`echo $oldname | sed s/$firstpart/$firstpart.$datepart/`; 
    cp -i ${oldname} ${newname}; 
    fi 
}


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


