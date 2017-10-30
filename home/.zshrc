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
plugins=(z extract history-substring-search git colorize colored-man copydir copyfile django docker fabric gem knife python rsync ruby virtualenv vagrant tmux svn sudo sublime vi-mode screen )
#virtualenvwrapper 
#
source $ZSH/oh-my-zsh.sh

# User configuration

if [ PMI_ZSHRC_SET = 0 ]; then exit 0 ; fi
export PMI_ZSHRC_SET=0

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/hg2g/apps/npm/bin
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
HG2G="/hg2g/home/pmichalec/hg2g"

which wmname > /dev/null && wmname LG3D
export TERM="xterm-256color"
#export TERM=screen-256color       # for a tmux -2 session (also for screen)
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

# history search # Ubuntu 12.04 users: bindkey '^[[A'
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

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

export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/sbin:/opt/bin:~/bin:~/opt/bin:/usr/local/bin:/usr/X11R6/bin
#export PATH=$PATH:/opt/IBM/db2/V8.1/bin
#export PATH=$PATH:/usr/lib/qt-3.3/bin
#export PATH=/opt/openoffice4/program:$PATH
export PATH=$HOME/.local/bin:$PATH

export CDPATH=".:~/hg2g:~/annex:$CDPATH"
export PROJECTS=$HOME/annex/cli-ibm/projects
test -e $PROJECTS && export CDPATH="$CDPATH:$PROJECTS"

psg () { ps -ax | grep $* | grep -v grep }    # hleda v bezicich procesech


export PMI_ZSHRC_SET=1

#lotus notes
#export PATH=$PATH:/home/epcim/lotus/notes/data
#export PATH=$PATH:/etc/alternatives
#export PATH=$PATH:/opt/libreoffice3.5/program

#Chef

function knife-reset {
  # set environment for knife/chef
  export SSL_CERT_FILE=/opt/chefdk/embedded/ssl/certs/cacert.pem
  alias ack="ack --ignore-dir .kitchen" # to ignore log files from CI
}
knife-reset

function knife-reset-apealive_net {
  knife-reset
  export CHEF_SERVER='https://api.opscode.com/organizations/apealive_net'
  export ORGNAME=apealive_net
  export ORGUSER=apealive
  export CHEF_SSL_CERT_FILE=$HOME/.chef/chef.$ORGNAME.crt
  ln -fs $HOME/.chef/$ORGNAME-$ORGUSER.pem $HOME/.chef/client.pem
  ln -fs $HOME/.chef/$ORGNAME-validator.pem $HOME/.chef/validator.pem
}

function knife-reset-blueit_cz {
  knife-reset
  export CHEF_SERVER='https://api.opscode.com/organizations/blueit_cz'
  export ORGNAME=blueit_cz
  export ORGUSER=apealive
  export CHEF_SSL_CERT_FILE=$HOME/.chef/chef.$ORGNAME.crt
  ln -fs $HOME/.chef/$ORGNAME-$ORGUSER.pem $HOME/.chef/client.pem
  ln -fs $HOME/.chef/$ORGNAME-validator.pem $HOME/.chef/validator.pem
}

function knife-reset-gtshub {
  knife-reset
  #export CHEF_SERVER='https://10.10.x.x'
  export ORGNAME=gtshub
  export ORGUSER=$USER
  export CHEF_SSL_CERT_FILE=$HOME/.chef/chef.$ORGNAME.crt
  ln -fs $HOME/.chef/$ORGNAME-$ORGUSER.pem $HOME/.chef/client.pem
  ln -fs $HOME/.chef/$ORGNAME-validator.pem $HOME/.chef/validator.pem
}

function knife-reset-kb {
  knife-reset
  #export CHEF_SERVER='https://10.10.x.x'
  export ORGNAME=projectkb
  export ORGUSER=$USER
  export CHEF_SSL_CERT_FILE=$HOME/.chef/chef.$ORGNAME.crt
  ln -fs $HOME/.chef/$ORGNAME-$ORGUSER.pem $HOME/.chef/client.pem
  ln -fs $HOME/.chef/$ORGNAME-validator.pem $HOME/.chef/validator.pem
}

function knife-reset-vums {
  knife-reset
  export CHEF_SERVER='https://chef.vums.blueit'
  export ORGNAME=vums
  export ORGUSER=$USER
  export CHEF_SSL_CERT_FILE=$HOME/.chef/chef.$ORGNAME.crt
  ln -fs $HOME/.chef/$ORGNAME-$ORGUSER.pem $HOME/.chef/client.pem
  ln -fs $HOME/.chef/$ORGNAME-validator.pem $HOME/.chef/validator.pem
}

# DEPRECATED: use ~/bin/ssh-config-compile
#function ssh-config-compile {
#    mv ~/.ssh/config ~/.ssh/config.old
#    cat ~/.ssh/config.d/* > ~/.ssh/config;
#}


#fix
export PATH=/usr/local/bin:$PATH

## https://github.com/vincentbernat/zshrc/blob/master/rc/bookmarks.zsh

# Handle bookmarks. This uses the static named directories feature of
# zsh. Such directories are declared with `hash -d
# name=directory`. Both prompt expansion and completion know how to
# handle them. We populate the hash with directories.
#
# With autocd, you can just type `~-bookmark`. Since this can be
# cumbersome to type, you can also type `@@` and this will be turned
# into `~-` by ZLE.

#is-at-least 4.3.12 && __() {
__() {
    MARKPATH=$ZSH/run/marks

    # Add some static entries
    hash -d log=/var/log
    hash -d doc=/usr/share/doc

    # Populate the hash
    for link ($MARKPATH/*(N@)) {
        hash -d -- -${link:t}=${link:A}
    }

    vbe-insert-bookmark() {
        emulate -L zsh
        LBUFFER=${LBUFFER}"~-"
    }
    zle -N vbe-insert-bookmark
    bindkey '@@' vbe-insert-bookmark

    # Manage bookmarks
    bookmark() {
        [[ -d $MARKPATH ]] || mkdir -p $MARKPATH
        if (( $# == 0 )); then
            # When no arguments are provided, just display existing
            # bookmarks
            for link in $MARKPATH/*(N@); do
                local markname="$fg[green]${link:t}$reset_color"
                local markpath="$fg[blue]${link:A}$reset_color"
                printf "%-30s -> %s\n" $markname $markpath
            done
        else
            # Otherwise, we may want to add a bookmark or delete an
            # existing one.
            local -a delete
            zparseopts -D d=delete
            if (( $+delete[1] )); then
                # With `-d`, we delete an existing bookmark
                command rm $MARKPATH/$1
            else
                # Otherwise, add a bookmark to the current
                # directory. The first argument is the bookmark
                # name. `.` is special and means the bookmark should
                # be named after the current directory.
                local name=$1
                [[ $name == "." ]] && name=${PWD:t}
                ln -s $PWD $MARKPATH/$name
            fi
        fi
    }
} && __



