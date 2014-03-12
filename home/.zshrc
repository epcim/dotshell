# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="solarized-powerline"
ZSH_THEME="powerline"
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# REMOVED: common-aliases
plugins=(git colorize colored-man copydir copyfile django docker fabric gem knife python rsync ruby virtualenv vagrant tmux svn sudo sublime vi-mode screen )
#virtualenvwrapper 
#
source $ZSH/oh-my-zsh.sh

# User configuration

if [ PMI_ZSHRC_SET = 0 ]; then exit 0 ; fi
export PMI_ZSHRC_SET=0

export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

# For logins without GDM, start Xorg promptly
# if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ] ; then
#   startx --
# fi



# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Midnight Commander chdir enhancement
export LC_ALL=C
if [ -f /usr/share/mc/mc.gentoo ]; then
   . /usr/share/mc/mc.gentoo
fi


#PMi - TB reviewd
#autoload -U compinit promptinit
#compinit
#promptinit; 
#prompt gentoo
#prompt pws

# ssh
export SSH_KEY_PATH="~/.ssh/id_dsa"


##################################
## PMi CUSTOM

set -o vi

touch $HOME/.zshrc.aliases
touch $HOME/.zshrc.local
source $HOME/.zshrc.aliases
source $HOME/.zshrc.local

HOWTO="$HOME/hg2g/howto"
HG2GL="/hg2g/home/pmichalec/hg2g"

which wmname > /dev/null && wmname LG3D
export TERM="xterm-256color"
export AWT_TOOLKIT=MToolkit

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)


### OH MY ZSH CUSTOMIZATIONS
#

















# Command history environment variables
HISTFILE=~/.history
export HISTFILE=~/.history
HISTSIZE=5000
SAVEHIST=5000
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

# Set options
export LANG=en_US.UTF-8
#export LANG=en_US
export LC_ALL=en_US.UTF-8
export LC=en_US.UTF-8
export BLOCKSIZE=K
export EDITOR=vim























## this one is very nice:
## cursor up/down look for a command that started like the one starting on the command line
#function history-search-end {
#    integer ocursor=$CURSOR
#
#    if [[ $LASTWIDGET = history-beginning-search-*-end ]]; then
## Last widget called set $hbs_pos.
#        CURSOR=$hbs_pos
#    else
#        hbs_pos=$CURSOR
#    fi
#
#    if zle .${WIDGET%-end}; then
## success, go to end of line
#        zle .end-of-line
#    else
## failure, restore position
#        CURSOR=$ocursor
#    return 1
#        fi
#}
#
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end

# some keys
#bindkey "\e[A" history-beginning-search-backward #cursor up
#bindkey "\e[B" history-beginning-search-forward  #cursor down
#bindkey "\e[A" history-beginning-search-backward-end #cursor up
#bindkey "\e[B" history-beginning-search-forward-end

#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

#for keymap in v a; do
#      bindkey -$keymap ^f  history-incremental-search-backward
#done
bindkey "^R" history-incremental-search-backward

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
LISTMAX=0

## disable mail checking
#MAILCHECK=0

autoload -U colors
colors

# ################################################
## -- other -- not important/overload by oh-my-zsh
# ################################################

##allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
## keep background processes at full speed
setopt NOBGNICE
## restart running processes on exit
#setopt HUP
#









# Set prompts
#PROMPT="%B%{$fg_bold[gray]%}%T%{$fg_bold[white]%}> %b"
#RPS1="%{$fg_bold[white]%}<%{$fg_no_bold[green]%}%n%{$fg_bold[green]%}@%{$fg_no_bold[green]%}%m%{$fg_bold[white]%}:%{$bg_bold[black]%}%{$fg_bold[blue]%}%~%b"
##PS1='%B>%b'
##RPS1='%B<%h %m:%~%b'

bindkey -v                 # editor jako vi
bindkey ' ' magic-space    # mezern?k rozbaluje odkazy na historii

setopt EXTENDED_GLOB         # roz???en? ?ol?kov? znaky
setopt NO_CLOBBER            # ochrana p?i p?esm?rov?v?n? v?stup?
setopt CORRECTALL            # opravy p?eklep?
setopt NO_BEEP              # nep?pat p?i chyb?ch

# File completion
setopt AUTOLIST              # vypisuje mo?nosti pro dopln?n?
setopt NO_LIST_AMBIGUOUS     # vypisuje je HNED, ne a? p?i druh?m <Tab>
setopt LIST_PACKED           # zkr?cen? v?pis
setopt AUTOCD                # doplni cd na zacatek jmena napsaneho adresare

#zmodload -i zsh/complist     # obarv? vypisovan? soubory
#LS_COLORS="di=01;32;40:$LS_COLORS"  # http://zsh.sunsite.dk/Guide/zshguide06.html
#zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

autoload zmv                    # skupinove presouvani a prejmenovani	zmv (*).doc $1.txt | zmv (**/)README $1CTIMNE
##autoload -U compinit         # aktivuje "standardn?" pravidla pro dopl?ov?n?
##compinit

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
bindkey '^[^e' expand-alias

alias grep="grep --color --directories=recurse --exclude='*~'" # pozor neuzivat k tomu GREP_OPTIONS 

export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/sbin:/opt/bin/:~/bin:~/opt/bin:/usr/local/bin/:/usr/X11R6/bin/:~/opt/vuze/:~/opt/eclipse/:~/hg2g/dev/workspace-android/android-sdk-linux_86:~/hg2g/dev/workspace-android/android-sdk-linux_86/tools
export PATH=$PATH:/opt/IBM/db2/V8.1/bin
export PATH=$PATH:/usr/lib/qt-3.3/bin
export PATH=/opt/openoffice4/program:$PATH

export CDPATH=".:~/hg2g"
psg () { ps -ax | grep $* | grep -v grep }    # hleda v bezicich procesech


export PMI_ZSHRC_SET=1

#lotus notes
#export PATH=$PATH:/home/epcim/lotus/notes/data
#export PATH=$PATH:/etc/alternatives
#export PATH=$PATH:/opt/libreoffice3.5/program

#Chef
function knife-reset-gtshub {
  ORGNAME=gtshub
  export SSL_CERT_FILE=$HOME/.chef/chef.$ORGNAME.crt
  export ORGNAME SSL_CERT_FILE
}
knife-reset-gtshub

