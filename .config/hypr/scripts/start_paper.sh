#!/bin/sh

dir="/home/naokotani/Pictures/wallpapers/"
monitor1="eDP-1"
monitor2="DP-1"

cd $dir

papers=("${dir}"*.png)

cd /home/naokotani/.config/hypr/


length=${#papers[@]}

first=$((1 + $RANDOM % $length - 1))

function dif_random {
  second=$((1 + $RANDOM % $length - 1))

  if [ $1 -eq $second ]
  then
    dif_random "$1"
  else
    return $second
  fi
}

if [ $length -gt 1 ] 
then
  dif_random "$first"
  second=$?
else
  second=$first
fi

paper_one=${papers[$first]}
paper_two=${papers[$second]}

if pgrep -x "hyprpaper" > /dev/null
then
  hyprctl hyprpaper wallpaper "${monitor1},${paper_one}"
  hyprctl hyprpaper wallpaper "${monitor2},${paper_two}"
else
  rm -f hyprpaper.conf
  for p in "${papers[@]}";
  do
      echo "preload = ${p}" >> hyprpaper.conf
  done

  echo "wallpaper = ${monitor1},${paper_one}" >>  hyprpaper.conf
  echo "wallpaper = ${monitor2},${paper_two}" >> hyprpaper.conf

  hyprpaper &
fi

