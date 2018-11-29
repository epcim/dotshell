#!/bin/bash -ex

if [[ -e /usr/bin/apt-get ]]; then
    sudo apt-get install -y git zsh fish curl
elif [[ -e /usr/bin/yum ]]; then
    sudo yum install -y git zsh fish curl
elif [[ -e /usr/local/bin/brew ]]; then
    brew install git zsh fish homeshick
fi


# Get homeshick
which homeshick || {
    git clone "https://github.com/andsens/homeshick.git" $HOME/.homesick/repos/homeshick
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
}

# ##############################################################

# this
test -e $HOME/.homesick/repos/dotshell || {
    homeshick clone --batch git://github.com/epcim/dotshell.git
}
# OPTIONALLY
test -d $HOME/.homesick/repos/dotfiles || \
    homeshick clone --batch git://github.com/epcim/dotfiles.git
test -d $HOME/.homesick/repos/dotvim || \
    homeshick clone --batch git://github.com/epcim/dotvim.git
    
homeshick link dotshell
    
# fish & oh-my-fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# zsh & powerline
homeshick clone --batch robbyrussell/oh-my-zsh
homeshick clone --batch https://github.com/seebi/dircolors-solarized
ln -s $HOME/.homesick/repos/dircolors-solarized/dircolors.256dark $HOME/.dircolors
ln -s $HOME/.homesick/repos/dircolors-solarized/dircolors.256dark $HOME/.dir_colors
#git clone --batch https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git ~/.oh-my-zsh/custom/themes/powerline
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# DEPRECATED
#sudo pip install --user powerline-status
#sudo pip install powerline-status
git clone https://github.com/powerline/fonts $HOME/.homesick/repos/powerline-fonts
$HOME/.homesick/repos/powerline-fonts/install.sh

#git clone https://github.com/ryanoasis/nerd-fonts $HOME/.homesick/repos/nerd-fonts

#FIXME, on osx only
brew tap caskroom/fonts
brew cask install font-hack-nerd-font


echo "call all bootstrap.sh (in other repos)"
find $HOME/.homesick/repos/ -name "bootstrap.sh" -type f -exec echo "{}" ";"

#TODO, remaining move to salt workspace/worksrtation model
# set default shell
#which zsh && chsh -s $(which zsh)
#which fish && chsh -s $(which fish)

# install z
#curl https://raw.githubusercontent.com/rupa/z/master/z.sh -o ~/bin/z.sh
#chmod u+x ~/bin/z.sh

# install fisherman for fish
#npm i -g fisherman # https://github.com/fisherman/fisherman
