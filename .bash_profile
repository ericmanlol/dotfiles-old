# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

#[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
source /home/woo/.rvm/scripts/rvm
[[ -s "/Users/woo/.gvm/scripts/gvm" ]] && source "/Users/woo/.gvm/scripts/gvm"
