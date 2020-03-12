#!/bin/bash

current=`setxkbmap -query | grep layout | cut -d ' ' -f 6`
echo $current
if [ "$current" == "ru" ]
then
    notify-send -t 1000 -i keyboard "switched to: us"
    setxkbmap us
else
    notify-send -t 1000 -i keyboard "switched to: ru" 
    setxkbmap ru
fi

