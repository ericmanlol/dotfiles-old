Yo dawg. I heard you like the matrix, so I put the matrix in the matrix in the matrix. :3
![ss](http://i.imgur.com/Yh52xk1.png)




Screen Shot:

Clean via 10-25-2013:
![ss](http://i.imgur.com/4YLs34Y.jpg)

Dirty - 4-23-2014
![ss](http://ericman.com/s/dat_sneak_preview.png)

Soon:
- Since switching completely to zsh, prepping for entire zsh overhaul, segregated functions, etc.
- drop in some of my irssi configs
- increase tmux-irssi love. [via hotkey settings to auto-resize screen space for nicklist fifo]


Todo: 
- make a dependency list for quick install (include a scripted generated list of any external file deps, as I forgot to install autopep8 on my laptop and spent an hour thinking that life no longer made sense when I couldn't autopep8 after doing a pull on mobile :3)
- copy/paste works fine but I'd like to have a right click menu dammit. 
    - look for/research urxvt right click menu or make one myself. or look into xclip.
- (contingent) emacs around spring break time, didn't get a chance during x-mas.
- add in my scripts for bootstrapping system-level(userland) things the way I want them.
- add dev branch for unstable changes / experimentation.

Terminal right now is urxvtd with each new spawned terminal attaching to the
backgrounded daemon.

General configs
---------------
How to use?

###Install dotfiles
```
$pip install dotfiles
```
or from src:
```
https://pypi.python.org/packages/source/d/dotfiles/dotfiles-0.6.0.tar.gz
```

###Clone my repo
``` 
cd ~ && git clone github.com/ericmanlol/dotfiles.git
```

### Open up runtime config file
```
vim  ~/.dotfilesrc
```

### Drop this inside .dotfilesrc (be aware of PEP8):
```python
[dotfiles]
repository = ~/Dotfiles
ignore = [
    '.git',
    '.gitignore',
    '*.swp']
externals = {
    '.bzr.log':     '/dev/null',
    '.uml':         '/tmp'}
```
###Sync it up!  
```
$dotfiles --sync
```

###Fin.

PRE-REQUISITES / LE DEPENDENCIES (work in progress)
---
1. autopep8
2. vim(~7.4-ish) compiled with python enabled
    -   You can reference the included build-script located over: [here](https://github.com/ericmanlol/dotfiles/blob/master/buildvim.sh)
    
    -   otherwise your own flavor of something sane like this:
```
./configure --prefix=/usr/local/bin --with-features=huge --with-compiledby="woo" --enable-multibyte \ 
--enable-gui=gtk2 --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-luainterp 
```

    


VIM
---
For my ViM plugins you want to have NeoBundle installed ala:
```
 $ mkdir -p ~/.vim/bundle
 $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
```
$ vim ~/.vimrc
```
from vim
``` 
:NeoBundleInstall
```

The previous step will install all my bundled vim plugins/colors and such

Note: For powerline/airline please be aware you will have to either patch your fonts or use one of the patched fonts.
I've switched from dina back to terminus; which is fine by me as I've realized dina is xft/AA. 

Double Note: I did include a build script for the flags I run when compiling from source. :)

zsh
---
my custom zsh theme can be found in my fork: https://github.com/ericmanlol/oh-my-zsh/blob/master/themes/woo.zsh-theme




