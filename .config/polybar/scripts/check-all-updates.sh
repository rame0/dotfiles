#!/bin/sh
#source https://github.com/x70b1/polybar-scripts
#
#
#if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
#    updates_arch=0
#fi
#
## if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
#if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
#    updates_aur=0
#fi
#
#updates=$(("$updates_arch" + "$updates_aur"))
#
#if [ "$updates" -gt 0 ]; then
#    echo " $updates"
#else
#    echo "0"
#fi
#


updates_flat=$(echo 'n' | flatpak update 2>/dev/null | tail -n +5 | head -2 | wc -l)

if [ "$updates_flat" -gt 0 ]; then
    echo "f:$updates_flat"
else
    echo ""
fi

updates_apt=$(apt list --upgradable 2> /dev/null | grep -c upgradable);

if [ "$updates_apt" -gt 0 ]; then
    echo "a:$updates_apt"
else
    echo ""
fi

updates=$(("$updates_flat" + "$updates_apt"))

if [ "$updates" -gt 0 ]; then
    echo "t $updates"
else
    echo "0"
fi