#github.com/ericmanlol/dotfiles
#https://github.com/robbyrussell/oh-my-zsh
#
#
#based on gourmet copypasta from the net + rapid retard style trial and error
#





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

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

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

# do i need to explicitly declare this still? with inc_append_history set? humm
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_verify
# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history



## Completion Settings
######################

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end


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


alias src='source ~/.zshrc'
