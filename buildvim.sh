#!/bin/sh

# ./configure \
# --prefix=/usr/local/bin \
# --with-features=huge \
# --with-compiledby="woo" \
# --enable-multibyte \
# --enable-gui=gtk2 \
# --enable-rubyinterp \
# --enable-pythoninterp \
# --with-python-config-dir=/usr/local/lib/python2.7/config \
# #--enable-pythoninterp \
# #--with-python-config-dir=/usr/local/lib/python2.7/config \
# --enable-luainterp
# #--with-lua-prefix=/usr --with-luajit \
# #--enable-gpm \
#--enable-cscope \
#--enable-fontset \
#--enable-fail-if-missing


#current for 7.4 -- 4-15-2014
./configure --prefix=/usr/local/bin --with-features=huge --with-compiledby="woo" --enable-multibyte \
--enable-gui=gtk2 --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-luainterp 
