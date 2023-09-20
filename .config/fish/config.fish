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
set -gx PATH $PATH /usr/lib/cuda-10.2/lib64/

set -Ux LD_LIBRARY_PATH /usr/lib/cuda-10.2/lib64/
set -Ux LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/lib/cuda-10.2/include/
set -Ux LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/lib/cuda-10.2/extras/CUPTI/lib64/
set -Ux CUDA_HOME /usr/lib/cuda-10.2/

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
alias tlmgr=tllocalmgr

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


# #
# ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
# █▀▄▄▀█ ▄▄▀█▀▄▄▀█ ▄▀▄ █▀▄▄▀█▄ ▄
# █ ▀▀ █ ▀▀▄█ ██ █ █▄█ █ ▀▀ ██ █
# █ ████▄█▄▄██▄▄██▄███▄█ █████▄█
# ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
# #
#


set -U fish_color_user magenta
set -U fish_color_host yellow

function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  printf "┌──("
  # User
  set_color $fish_color_user
  printf (whoami)

  # Icon
  set_color $fish_color_cwd
  if functions -q fish_is_root_user; and fish_is_root_user
	printf "💀"
  else
  	printf " → "
  end

  # Host
  set_color $fish_color_host
  printf (hostname -s)
  set_color normal

  printf ')-['

  # PWD
  set_color $fish_color_cwd
  printf (prompt_pwd)
  set_color normal

  printf "]"

  fish_prompt_git
  # I prefer to have a new-line here but messes with the prompt when resizing
  echo

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  printf '└─$ '
  set_color normal
end

set -U fish_color_git_clean green
set -U fish_color_git_dirty red
set -U fish_color_git_ahead red
set -U fish_color_git_staged yellow

set -U fish_color_git_added green
set -U fish_color_git_modified blue
set -U fish_color_git_renamed magenta
set -U fish_color_git_deleted red
set -U fish_color_git_unmerged yellow
set -U fish_color_git_untracked cyan

set -U fish_prompt_git_status_added '✚'
set -U fish_prompt_git_status_modified '*'
set -U fish_prompt_git_status_renamed '➜'
set -U fish_prompt_git_status_copied '⇒'
set -U fish_prompt_git_status_deleted '✖'
set -U fish_prompt_git_status_untracked '?'
set -U fish_prompt_git_status_unmerged !

set -U fish_prompt_git_status_order added modified renamed copied deleted untracked unmerged

function fish_prompt_git --description 'Write out the git prompt'
  set -l branch (git symbolic-ref --quiet --short HEAD 2>/dev/null)
  if test -z $branch
    return
  end

  printf '('

  set -l index (git status --porcelain 2>/dev/null)
  if test -z "$index"
    set_color $fish_color_git_clean
    printf $branch' ✓'
    set_color normal
  	printf ")"
    return
  end

  git diff-index --quiet --cached HEAD 2>/dev/null
  set -l staged $status
  if test $staged = 1
    set_color $fish_color_git_staged
  else
    set_color $fish_color_git_dirty
  end

  printf $branch' ⚡'

  set -l info
  for i in $index
    switch $i
      case 'A  *'
        set i added
      case 'M  *' ' M *'
        set i modified
      case 'R  *'
        set i renamed
      case 'D  *' ' D *'
        set i deleted
      case 'U  *'
        set i unmerged
      case '?? *'
        set i untracked
    end

    if not contains $i $info
      set info $info $i
    end
  end

  for i in added modified renamed deleted unmerged untracked
    if contains $i $info
      eval 'set_color $fish_color_git_'$i
      eval 'printf $fish_prompt_git_status_'$i
    end
  end

  set_color normal

  printf ")"
end


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

# pnpm
set -gx PNPM_HOME "/home/ra/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# if TMUX disable
if status is-interactive
and not set -q TMUX
    bind --erase \c\s\e\[A
    bind --erase \c\s\e\[C
    bind --erase \c\s\e\[B
    bind --erase \c\s\e\[D
end


nvm use --lts
