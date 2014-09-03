#
# ~/.bashrc
#




# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#dem dotfiles bins
# [[ -d $HOME/.bin ]] && export PATH=$PATH:$HOME/.bin

# alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
# alias ipy='ipython'
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

export PS1='\[\033[0;35m\]┌┼─┼─ \[\033[0m\033[0;35m\]\u\[\033[0m\] @ \[\033[0;33m\]\h\[\033[0m\033[0;35m\] ─┤├─ \[\033[0m\]\t \d\[\033[0;35m\] ─┤├─ \[\033[0;33m\]\w\[\033[0;35m\] ─┤ \n\[\033[0;35m\]└┼─\[\033[0m\033[0;35m\]✭\[\033[0m\033[0;35m\]─┤▶\[\033[0m\]  ∴ '

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

export PATH="/usr/lib/cw:$PATH"

export LESSOPEN="| /usr/local/bin/source-highlight-esc.sh %s"
export LESS='-R '
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')


source /usr/local/bin/virtualenvwrapper.sh


## extract function
# extract() {
  # if [[ -f $1 ]]; then
# case $1 in
      # *.7z) 7z x $1;;
      # *.bz2) bunzip2 $1;;
      # *.gz) gunzip $1;;
      # *.rar) unrar x $1;;
      # *.tar) tar xvf $1;;
      # *.tar.bz2) tar xvjf $1;;
      # *.tar.gz) tar xvzf $1;;
      # *.tbz2) tar xvjf $1;;
      # *.tgz) tar xvzf $1;;
      # *.zip) unzip $1;;
      # *.Z) uncompress $1;;
      # *) echo "unable to extract '$1'..." ;;
    # esac
# else
# echo "'$1' is not a valid file!"
  # fi  
# }


# #backup function
# bak () 
# { 
# cp $1 ${1}-`date +%Y%m%d%H%M`.BAK ;
# }






# shopt -s histappend
# export PROMPT_COMMAND='history -a' 

# alias tmux='tmux -2'
# alias src='source ~/.bashrc'
#export TERM=xterm
export TERM="xterm-256color"



# GIT ALIASES
#=====================================================================
# alias g=git
# alias ga='git add'
# alias gb='git branch'
# alias gba='git branch -a'
# alias gbv='git branch -v'

# alias gp='git push'
# alias gpom='git push origin master'
# alias gpu='git push -u'

# alias gst='git status -sb'
# alias gs='git status'
# alias gsa='git stash apply'
# alias gr='git stash && git svn rebase && git svn dcommit && git stash pop' # git refresh
# alias gd='git diff | $GIT_EDITOR -'
# alias gmv='git mv'
# alias gho='$(git remote -v 2> /dev/null | grep github | sed -e "s/.*git\:\/\/\([a-z]\.\)*/\1/" -e "s/\.git$//g" -e "s/.*@\(.*\)$/\1/g" | tr ":" "/" | tr -d "\011" | sed -e "s/^/open http:\/\//g")'

# #commits gc(x);
# alias gcm='git commit -m'
# alias gc='git commit -v'

# # git log color hotness
# git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"



# dir colors (going give solarized a whirl)
# fyi: https://raw2.github.com/seebi/dircolors-solarized/master/dircolors.256dark
#=====================================================================
eval `dircolors /home/woo/.dircolors`




#general/misc aliases
#=====================================================================
alias ls='ls --color=always'
alias ll='ls -alh'
alias svim='vim -u ~/.vimrc_simple'
alias psef='ps -ef | grep'
alias psg='ps -ef | grep -i'
alias nspln='netstat -plaunt'


#python
#=====================================================================
alias ipy='ipython --profile='woo''


#avoiding the 'screen-256color' unknown terminal type
alias ssh='TERM=xterm ssh'


#below was just a joke flying around facebook
#alias fuckitYOLO='git commit -am "DEAL WITH IT (trolling, not serious)" && git push -f origin master'


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias sc='systemctl'




buf () {
    oldname=$1; 
    if [ "$oldname" != "" ]; 
    then datepart=$(date +%Y-%m-%d); 
    firstpart=`echo $oldname | cut -d "." -f 1`; 
    newname=`echo $oldname | sed s/$firstpart/$firstpart.$datepart/`; 
    cp -i ${oldname} ${newname}; 
    fi 
}


case "$TERM" in
  screen)
    PROMPT_COMMAND='echo -ne "\033k$hostname\033\\"'
    ;;
esac

xmodmap ~/.Xmodmap
