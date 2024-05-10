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


# Kubectl
set -gx KUBECONFIG $HOME/.kube/config

set TERM "xterm-256color"

#disable fish greeting
set -g fish_greeting
#function fish_greeting
#  neofetch
#end

### TMUX
#if status is-interactive
#and not set -q TMUX
#    exec tmux
#END

# global
set -gx PATH $PATH /usr/sbin /sbin /snap/bin $HOME/.config/composer/vendor/bin
set -gx PATH $PATH /usr/lib/docker/cli-plugins

# dotnet
set -gx PATH $PATH $HOME/.dotnet/tools

# go lang
set -gx PATH $PATH /usr/local/go/bin

# CUDA & CUDNN
set -gx PATH $PATH /usr/local/cuda/bin/
#set -gx PATH $PATH /usr/local/cuda/lib64/

set -Ux LD_LIBRARY_PATH /usr/local/cuda/lib64/
set -Ux LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda/include/
set -Ux LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64/
set -Ux CUDA_HOME /usr/local/cuda

# TEX
set -Ux TEXMFDIST /usr/share/texmf-dist
set -Ux TEXMFLOCAL /usr/local/share/texmf:/usr/share/texmf
set -Ux TEXMFSYSVAR /var/lib/texmf
set -Ux TEXMFSYSCONFIG /etc/texmf
set -Ux TEXMFHOME $HOME/texmf
set -Ux TEXMFVAR $HOME/.texlive/texmf-var
set -Ux TEXMFCONFIG $HOME/.texlive/texmf-config
set -Ux TEXMFCACHE $TEXMFSYSVAR
#;$TEXMFVAR

# #
# ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
# █ ▄▄▀█ ███▄██ ▄▄▀█ ▄▄█ ▄▄█ ▄▄
# █ ▀▀ █ ███ ▄█ ▀▀ █▄▄▀█ ▄▄█▄▄▀
# █▄██▄█▄▄█▄▄▄█▄██▄█▄▄▄█▄▄▄█▄▄▄
# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
# #

alias ls='ls --color=auto'
alias dir='dir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Enable EXA (ls replacement)
if type -q exa
    alias ls='exa --color=auto --group-directories-first'
	alias la='ls'
    alias l='ls -F'
else
    alias la='ls -A'
  	alias l='ls -CF'
end

# BAT - A cat(1) clone with syntax highlighting and Git integration.
if type -q batcat
    alias cat="batcat"
else if type -q bat
    alias cat="bat"
end

# some more ls aliases
alias ll='ls -lah'
alias em='emacs -nw'
alias dd='dd status=progress'
#alias _='sudo'


alias gti='git'
#alias tmux='tmux -2'
alias less='less -R'
alias diff='colordiff'
alias dc='cd'

#git
alias glog='git log --oneline --graph --color --all --decorate'
alias gitl='git log --pretty=oneline'
alias gstat='git status'

# commitlint
#alias clint='commitlint --config $HOME/.config/commitlint.config.js'
alias clint='commitlint --extends "@commitlint/config-conventional"'


# fun aliases
alias nethack-online='ssh nethack@nethack.alt.org ; clear'
alias tron-online='ssh sshtron.zachlatta.com ; clear'



#  ██████╗ ██╗████████╗
# ██╔════╝ ██║╚══██╔══╝
# ██║  ███╗██║   ██║
# ██║   ██║██║   ██║
# ╚██████╔╝██║   ██║
#  ╚═════╝ ╚═╝   ╚═╝

function commits
  git log --author="$argv" --format=format:%ad --date=short | uniq -c | awk '{print $1}' | spark | lolcat
end


# ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
# █ ▄▄█ ██ █ ▄▄▀█▀▄▀█▄ ▄██▄██▀▄▄▀█ ▄▄▀█ ▄▄
# █ ▄██ ██ █ ██ █ █▀██ ███ ▄█ ██ █ ██ █▄▄▀
# █▄████▄▄▄█▄██▄██▄███▄██▄▄▄██▄▄██▄██▄█▄▄▄
# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

function spark --description Sparklines
    argparse --ignore-unknown --name=spark v/version h/help m/min= M/max= -- $argv || return

    if set --query _flag_version[1]
        echo "spark, version 1.1.0"
    else if set --query _flag_help[1]
        echo "Usage: spark <numbers ...>"
        echo "       stdin | spark"
        echo "Options:"
        echo "       --min=<number>   Minimum range"
        echo "       --max=<number>   Maximum range"
        echo "       -v or --version  Print version"
        echo "       -h or --help     Print this help message"
        echo "Examples:"
        echo "       spark 1 1 2 5 14 42"
        echo "       seq 64 | sort --random-sort | spark"
    else if set --query argv[1]
        printf "%s\n" $argv | spark --min="$_flag_min" --max="$_flag_max"
    else
        command awk -v min="$_flag_min" -v max="$_flag_max" '
            {
                m = min == "" ? m == "" ? $0 : m > $0 ? $0 : m : min
                M = max == "" ? M == "" ? $0 : M < $0 ? $0 : M : max
                nums[NR] = $0
            }
            END {
                n = split("▁ ▂ ▃ ▄ ▅ ▆ ▇ █", sparks, " ") - 1
                while (++i <= NR)
                    printf("%s", sparks[(M == m) ? 3 : sprintf("%.f", (1 + (nums[i] - m) * n / (M - m)))])
            }
        ' && echo
    end
end


# if TMUX disable
if status is-interactive
and not set -q TMUX
    bind --erase \c\s\e\[A
    bind --erase \c\s\e\[C
    bind --erase \c\s\e\[B
    bind --erase \c\s\e\[D
end


#nvm use --lts


# pnpm
set -gx PNPM_HOME "/home/ra/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
