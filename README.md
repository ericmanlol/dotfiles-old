Yo dawg. I heard you like the matrix, so I put the matrix in the matrix in the matrix. :3
![ss](http://i.imgur.com/Yh52xk1.png)




As of Octoberish-2013 still work in progress (~80% done, still updating .vim configs)
--------------------------
Mad Scientist Plans:
- Re-do wm config [x]
- Add completely re-vamped vim. [x]
- Migration from screen to tmux. [x]
- Migration from bash to zsh. [x]
    - currently using zsh as secondary shell on shift+mod+enter via tmux (this has been going well)
    - zsh has been primary as of late in terms of workflow, will probably keep bash around though just in case.
    -  todo: implement something to deal with nested tmux sessions when elevating to zsh. (currently have zsh sessions all spawn in tmux)


Screen Shot:

Clean via 10-25-2013:
![ss](http://i.imgur.com/4YLs34Y.jpg)
Dirty via 10-25-2013
![ss](http://i.imgur.com/M6Qjnff.png)




Todo: 
- make a dependency list for quick install
- integrate taglist-y system to vim that has tags by SCOPE, christ.
- emacs bash key bindings (ctrl+right arrow | ctrl + left arrow) I believe 
were overwritten by my adventures in urxvt perl extension land.
- copy/paste works fine but I'd like to have a right click menu dammit. 
    - look for/research urxvt right click menu or make one myself. or look into xclip.
- ever elusive sortable taglist by scope
- added my theme to my fork of ohmyzsh

Terminal right now is urxvtd with each new spawned terminal attaching to the
backgrounded daemon.

General configs
---------------
How to use?

1.  Install dotfiles
```
$pip install dotfiles
```
or from src:
```
https://pypi.python.org/packages/source/d/dotfiles/dotfiles-0.6.0.tar.gz
```

2.  Clone my repo
``` 
cd ~ && git clone github.com/ericmanlol/dotfiles.git
```

3.  Open up runtime config file
```
vim  ~/.dotfilesrc
```

4.  Drop this inside .dotfilesrc:
```
[dotfiles]
repository = ~/dotfiles
ignore = [
    '.git',
    '.gitignore',
    '*.swp']
externals = {
    '.bzr.log':     '/dev/null',
    '.uml':         '/tmp'}
```
5.  Sync it up!  
```
$dotfiles --sync
```

6.  Fin.


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


More Notes
----------
Some notes, in case anyone decides to clone:

As of 9-24-2013:



- I'm slowing trying out zsh, I will have tmux spawn a terminal with zsh as the prompt. Currently, I'm still on bash; in the interest of still getting things done.

- Previously, I had urxvt tabs binded to the shift keys, I've replaced that with having tmux tabs/windows being binded to the shift keys. Might write a if function to dictate, based on whats in focus, so I can have the best of both worlds.

- Switched over to tmux, trying it out, will still be using screen, screen updates to come.





