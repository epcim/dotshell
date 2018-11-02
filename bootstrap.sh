#!/bin/bash -ex

if [[ -e /usr/bin/apt-get ]]; then
    sudo apt-get install -y git zsh fish curl
elif [[ -e /usr/bin/yum ]]; then
    sudo yum install -y git zsh fish curl
elif [[ -e /usr/local/bin/brew ]]; then
    brew install git zsh fish homeshick
fi

test -e $HOME/.homesick/repos/dotshell || {
    homeshick clone --batch git://github.com/epcim/dotshell.git
}

# fish & oh-my-fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# zsh & zsh powerline theme
homeshick clone --batch robbyrussell/oh-my-zsh
homeshick clone --batch https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git
homeshick clone --batch https://github.com/seebi/dircolors-solarized

homeshick link dotshell

ln -s $HOME/.homesick/repos/oh-my-zsh-powerline-theme/powerline.zsh-theme $HOME/.oh-my-zsh/themes/
ln -s $HOME/.homesick/repos/dircolors-solarized/dircolors.256dark $HOME/.dircolors
ln -s $HOME/.homesick/repos/dircolors-solarized/dircolors.256dark $HOME/.dir_colors


#TODO, remaining move to salt workspace/worksrtation model
# set default shell
#which zsh && chsh -s $(which zsh)
#which fish && chsh -s $(which fish)

# install z
#curl https://raw.githubusercontent.com/rupa/z/master/z.sh -o ~/bin/z.sh
#chmod u+x ~/bin/z.sh

# install fisherman for fish
#npm i -g fisherman # https://github.com/fisherman/fisherman
