#
#
# ╔═══╗╔═══╗╔═╗╔═╗    ╔═══╗
# ║╔═╗║║╔═╗║║║╚╝║║    ║╔═╗║
# ║╚═╝║║║ ║║║╔╗╔╗║╔══╗║║ ║║
# ║╔╗╔╝║╚═╝║║║║║║║║╔╗║║║ ║║
# ║║║╚╗║╔═╗║║║║║║║║║═╣║╚═╝║
# ╚╝╚═╝╚╝ ╚╝╚╝╚╝╚╝╚══╝╚═══╝
#
# Ramil A.
# https://github.com/rame0
# https://rame0.ru
#
#


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export XDG_CONFIG_HOME=$HOME/.config/
export PATH=$PATH:/usr/sbin:/sbin:/snap/bin:$HOME/.config/composer/vendor/bin

# Jetbrains Toolbox
export PATH=$PATH:/home/ra/.local/share/JetBrains/Toolbox/scripts

#CUDA & CUDNN
export PATH=$PATH:/usr/lib/cuda/lib64/
export PATH=$PATH:/usr/lib/cuda/bin
export LD_LIBRARY_PATH=/usr/lib/cuda/lib64/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/cuda/include/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/cuda/extras/CUPTI/lib64/
export CUDA_HOME=/usr/lib/cuda/

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
force_color_prompt=yes

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
    prompt_color='\[\033[;32m\]'
    info_color='\[\033[1;34m\]'
    prompt_symbol=📛
    if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
    	prompt_color='\[\033[;94m\]'
    	info_color='\[\033[1;31m\]'
    	prompt_symbol=💀
    fi
    PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}'
    # user
    PS1+='('$info_color'\u${prompt_symbol}\h'$prompt_color')'
    # path
    PS1+='-[\[\033[0;1m\]\w'$prompt_color']'

    # git
    . ~/.dotfiles/git-prompt.sh

    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUPSTREAM=1
    GIT_PS1_SHOWCOLORHINTS=1

    PS1+='$(__git_ps1 "('$info_color'git: \[\033[0;1m\]%s'$prompt_color')")'

    # prompt
    PS1+='\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '
    # BackTrack red prompt
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

neofetch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# dotnet
export DOTNET_HOME="$HOME/.dotnet/tools"
export PATH="$DOTNET_HOME:$PATH"
# dothenend

export KUBECONFIG=$HOME/.kube/config

. "$HOME/.cargo/env"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
