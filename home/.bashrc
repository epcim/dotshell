# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
which wmname >/dev/null && wmname LG3D

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

test -e $HOME/Applications/git-annex.app && export PATH=/Applications/git-annex.app/Contents/MacOS:$PATH
test -e $HOME/hg2g/apps/git-annex.linux && export PATH=$HOME/hg2g/apps/git-annex.linux:$PATH
