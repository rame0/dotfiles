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


if [ -n "$TMUX" ]; then
    # called inside tmux session, do tmux things
    . ~/.profile

fi
# Trigger ~/.bashrc commands
. ~/.bashrc
