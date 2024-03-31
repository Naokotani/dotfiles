#!/bin/sh

pkill -9 hyprpaper

cd /home/naokotani/Pictures/wallpapers/

papers=(*.png)

cd /home/naokotani/.config/hypr/

rm -f hyprpaper.conf

length=${#papers[@]}

first=$((1 + $RANDOM % $length - 1))

echo "${first}"

function dif_random {
  second=$((1 + $RANDOM % $length - 1))

  if [ $1 -eq $second ]
  then
    dif_random "$1"
  else
    return $second
  fi
}

dif_random "$first"
second=$?

paper_one=${papers[$first]}
paper_two=${papers[$second]}

echo "preload = /home/naokotani/Pictures/wallpapers/${paper_one}" >> hyprpaper.conf
echo "preload = /home/naokotani/Pictures/wallpapers/${paper_two}" >> hyprpaper.conf
echo "wallpaper = eDP-1,/home/naokotani/Pictures/wallpapers/${paper_one}" >>  hyprpaper.conf
echo "wallpaper = DP-1,/home/naokotani/Pictures/wallpapers/${paper_two}" >> hyprpaper.conf

hyprpaper &
disown

