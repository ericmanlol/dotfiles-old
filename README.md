As of 9-19-2013
New Setup (About 40% done)
- Mad Scientist Plans left:
    - Add completely re-vamped vim.
    - Migration from bash to zsh.
    - Migration from screen to tmux.

Screen Shot:
![ss](http://i.imgur.com/3QPJM7J.jpg)





Todo: 
- make a dependency list for quick install
- integrate taglist-y system to vim that has tags by SCOPE, christ.
- emacs bash key bindings (ctrl+right arrow | ctrl + left arrow) I believe 
were overwritten by my adventures in urxvt perl extension land.
- copy/paste works fine but I'd like to have a right click menu dammit. 
    - look for elusive urxvt right click menu or make one myself.

Terminal right now is urxvtd with each new spawned terminal attaching to the
backgrounded daemon.

```
How to use?
1.)Install dotfiles
$pip install dotfiles
or
from src:
https://pypi.python.org/packages/source/d/dotfiles/dotfiles-0.6.0.tar.gz

2.) cd ~ && git clone github.com/ericmanlol/dotfiles.git

3.) vim  ~/.dotfilesrc

4.) drop this inside .dotfilesrc:
[dotfiles]
repository = ~/dotfiles
ignore = [
    '.git',
    '.gitignore',
    '*.swp']
externals = {
    '.bzr.log':     '/dev/null',
    '.uml':         '/tmp'}

5.) $dotfiles --sync

6.) fin
```

For my ViM plugins you want to have NeoBundle installed ala:
```
 $ mkdir -p ~/.vim/bundle
 $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
```
$ vim ~/.vimrc
```
from vim command-mode
``` :NeoBundleInstall
```

The previous step will install all my bundled vim plugins/colors and such


Some notes, in case anyone decides to clone:

As of 9-24-2013:



- I'm slowing trying out zsh, I will have tmux spawn a terminal with zsh as the prompt. Currently, I'm still on bash; in the interest of still getting things done.

- Previously, I had urxvt tabs binded to the shift keys, I've replaced that with having tmux tabs/windows being binded to the shift keys. Might write a if function to dictate, based on whats in focus, so I can have the best of both worlds.

- Switched over to tmux, trying it out, will still be using screen, screen updates to come.





