![ss](http://i.imgur.com/XqEetQq.png)

Todo: finish adding dependency list


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

3.) create a ~/.dotfilesrc

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




