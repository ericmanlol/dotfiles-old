As of 9-19-2013
New Setup (About 40% done)
- Mad Scientist Plans left:
    - Add completely re-vamped vim.
    - Migration from bash to zsh.
    - Migration from screen to tmux.

Screen Shot:
![ss](http://i.imgur.com/3QPJM7J.jpg)


#As of 9-18-2013
#OLD SETUP:
#![ss](http://i.imgur.com/XqEetQq.png)



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

```
For my ViM plugins you want to have Vundle installed ala:
1.)$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

2.)$ vim ~/.vimrc

3.)from vim command-mode :BundleInstall

4.)The previous step will install all my bundled vim plugins/colors and such

Some notes, in case anyone decides to clone:
-urxvt
    <shift>+<down>  --> spawns new urxvt tab  
    <shift>+<up>    --> renames infocus tab  
    <shift>+<left>  --> goto left tab  
    <shift>+<right> --> goto right tab  
    
-awesomewm
    i think vicious is broken in some aspects, will look later.
    uneeded, will fix later.

```




