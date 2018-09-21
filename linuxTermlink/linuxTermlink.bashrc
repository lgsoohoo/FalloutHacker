#Linux Termlink
#A Fallout theme for linux terminal editors
#by PikaLuca87
#https://github.com/lgsoohoo/FalloutHacker
#Summer 2018

#  !!! Warning: May need to edit the last line to include your username !!!

sleep 0.5
#echo -e '\033[92m' #force neon green
echo -e 'WELCOME TO ROBCO INDUSTRIES (TM) TERMLINK'
sleep 0.2

echo -e '\n>SET TERMINAL/INQUIRE'
sleep 0.1

echo -e '\nRIT-V300'
sleep 0.1

echo -e '\n>SET FILE/PROTECTION-OWNER:RWED ACCOUNTS.F'
sleep 0.1
echo '>SET HALT RESTART/MAINT'
sleep 0.1

echo -e '\nInitializing Robco Industries(TM) MF Boot Agent v2.3.0'
echo 'RETROS BIOS'
sleep 0.1
echo 'RBIOS-4.02.08.00 52EE5.57.E8'
echo 'Copyright 2201-2203 Robco Ind.'
sleep 0.1
echo 'Uppermem: 64 KB'
echo 'Root (5A8)'
echo 'Maintenance Mode'
sleep 0.2

echo -e '\n>RUN DEBUG/ACCOUNTS.F'
sleep 1
clear
sleep 0.2
echo -e 'WELCOME TO ROBCO INDUSTRIES (TM) TERMLINK\033[00m'

#set title
#currently not working
#PROMPT_s='echo -en "\033]0;ROBCO INDUSTRIES UNIFIED OPERATING SYSTEM\a"'


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
	#output (Directories) will still be dark blue

	#commands will use theme-color
    PS1='${debian_chroot:+($debian_chroot)} \n $(pwd | awk '"'"' {print toupper($0)}'"'"')\n> \[\033[00m\]'

	#commands will be neon green
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[92m\] \n $(pwd | awk '"'"' {print toupper($0)}'"'"')\n> \[\033[92m\]'

	#some output (ls, grep) will still be dark blue/colored
		#to make it all mono-color, remove the if-statement (~line #128) :
			# "enable color support of ls and also add handy aliases"
			#if [ -x /usr/bin/dircolors ]; then......

else
    PS1='${debian_chroot:+($debian_chroot)} \n $(pwd | awk '"'"' {print toupper($0)}'"'"')\n> '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
[ -r /home/pikaluca87/.byobu/prompt ] && . /home/pikaluca87/.byobu/prompt   #byobu-prompt#
