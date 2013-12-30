#!/bin/bash -ex

#TODO: Install zsh
#TODO: update to chef recipe

test -e $HOME/.homesick/repos/dotshell || {
    homeshick clone --batch git://github.com/epcim/dotshell.git
}

#zsh & zsh powerline theme
homeshick clone --batch robbyrussell/oh-my-zsh
homeshick clone --batch https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git

homeshick link dotshell

ln -s $HOME/.homesick/repos/oh-my-zsh-powerline-theme/powerline.zsh-theme $HOME/.oh-my-zsh/themes/

which zsh && chsh -s $(which zsh)

