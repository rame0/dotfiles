#!/bin/bash

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


# Find all dot files then if the original file exists, create a backup
# Once backed up to {file}.dtbak symlink the new dotfile in place
for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
    if [ -L ~/$file ]; then
        echo "~/$file already symlink. Skip...."
    elif [ -f ~/$file ]; then
        mv -f ~/$file{,.dtbak}
        ln -s $PWD/$file ~/$file
    else
        ln -s $PWD/$file ~/$file
    fi
done



if [ ! -d $HOME/.config ]; then
    mkdir -p $HOME/.config
fi

# Create simlinks for ~/.config directories
for dir in $(ls -d .config/*); do
    workdir="$HOME/$dir"
    if [ -d $workdir ]; then
        if [ -L "$workdir" ]; then
            echo "$workdir alredy simlink. Skip...."
            # skip dir continue to next one
            continue
        else
            echo "Backup $workdir to $workdir.bak"
            mv -f "$workdir" "$workdir.bak"
        fi
    fi

    ln -s "$PWD/$dir" "$workdir"
done

# Install Bat & Exa
echo "Installing bat (fot `batcat`) and exa (beautifule `ls`)"
sudo apt install bat exa

# Check if vim-addon installed, if not, install it automatically

# TODO: That check does not work!
if hash vim-addon  2>/dev/null; then
    echo "vim-addon (vim-scripts)  installed"
else
    echo "vim-addon (vim-scripts) not installed, installing"
    sudo apt update && sudo apt -y install vim-scripts
fi

echo "!!Done!!"
