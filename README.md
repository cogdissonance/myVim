myVim
=====

My entire vim

Installation:

    git clone git://github.com/cogdissonance/myVim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update
    

Follow this to make your own vim repo:
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
