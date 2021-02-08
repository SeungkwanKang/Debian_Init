# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
# Colors

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC='\e[0m'               # Color Reset

ALERT=${BWhite}${On_Red} # Bold White on red background

PS1="${Red}k${Yellow}a${Green}n${Cyan}g${Blue}s${Purple}k${White}@docker[debian10]:${Blue}\w${White}$ ${NC}"

# Color Man pages
export LESS_TERMCAP_mb=$'\e[1;33m' # Bold

export LESS_TERMCAP_md=$'\e[1;33m' # Blink
export LESS_TERMCAP_me=$'\e[0m'

export LESS_TERMCAP_so=$'\e[01;34m' # reverse video
export LESS_TERMCAP_se=$'\e[0m'

export LESS_TERMCAP_us=$'\e[1;4;31m' # underline
export LESS_TERMCAP_ue=$'\e[0m'

# Custom aliases

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ll='ls -lah --color'
alias lr='ls -Rh --color'
alias lt='tree'

export RC="$HOME/.bashrc"
export PATH="$HOME/.local/bin:$PATH"