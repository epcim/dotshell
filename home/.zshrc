
# aliases & fn
# ensure
touch $HOME/.profile
touch $HOME/.profile.local
touch $HOME/.zshrc.aliases
touch $HOME/.zshrc.local
# source
source $HOME/.profile
source $HOME/.profile.local
source $HOME/.zshrc.aliases
source $HOME/.zshrc.local

# history
#
HISTFILE=~/.history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.history
setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt hist_no_functions
setopt no_hist_beep
setopt hist_save_no_dups

# prompt (loaded from ~/.profile)
#which starship >/dev/null && eval "$(starship init zsh)"

# bind keys
bindkey -v                 # vi mode
bindkey ' ' magic-space    # space to expand shortcuts
bindkey '^[^e' expand-alias

setopt CORRECTALL            # typo (FYI: ~/.profile loads thefuck)
setopt NO_BEEP
setopt EXTENDED_GLOB
setopt NO_CLOBBER            # protect stdin redirect
# file/path completion
setopt AUTOLIST              # list options
setopt NO_LIST_AMBIGUOUS     # on the first TAB (not 2nd)
setopt LIST_PACKED           # list shortcuted
setopt AUTOCD                # prefix "cd" before dirname

# HELPERS
# fzf
fzf=$(which fzf)
[ -x $fzf -a -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ruppa/z (path shortcuts)
test -e ~/bin/z.sh &&\
  source ~/bin/z.sh

autoload zmv                 # group rename: zmv (*).doc $1.txt | zmv (**/)README $1CTIMNE
#autoload -U compinit        # std rules for autocomplete

expand-alias() {
	# for safety, in case there's an = which will mess things up...
	local alias=${LBUFFER#*=}
	if ! alias=$(alias $LBUFFER); then
		zle beep
		return 1
	fi
	LBUFFER=${(Q)${alias#*=}}
}
zle -N expand-alias

