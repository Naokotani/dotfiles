#!/bin/sh

pkill -9 hyprpaper

cd /home/naokotani/Pictures/wallpapers/

papers=(*.png)

cd /home/naokotani/.config/hypr/

rm hyprpaper.conf

length=${#papers[@]}

paper_one=${papers[$((1 + $RANDOM % $length - 1))]}
paper_two=${papers[$((1 + $RANDOM % $length - 1))]}

echo "preload = /home/naokotani/Pictures/wallpapers/${paper_one}" >> hyprpaper.conf
echo "preload = /home/naokotani/Pictures/wallpapers/${paper_two}" >> hyprpaper.conf
echo "wallpaper = eDP-1,/home/naokotani/Pictures/wallpapers/${paper_one}" >>  hyprpaper.conf
echo "wallpaper = DP-1,/home/naokotani/Pictures/wallpapers/${paper_two}" >> hyprpaper.conf

hyprpaper &
disown

