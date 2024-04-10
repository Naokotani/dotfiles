#!/bin/sh

cd /home/naokotani/.config/hypr/scripts

dir=$(cat "wallpapers_dir.conf")
monitor1="eDP-1"
monitor2="DP-1"

cd $dir

echo "$dir"

papers=("${dir}"*.png)

cd /home/naokotani/.config/hypr/

export HYPRLAND_INSTANCE_SIGNATURE=$(hyprctl instances | head -n 1 | sed 's/instance //' | sed 's/://');

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
  hyprctl hyprpaper wallpaper "${monitor1},${paper_one}" > /dev/null
  hyprctl hyprpaper wallpaper "${monitor2},${paper_two}" > /dev/null
else
  rm -f hyprpaper.conf

  for p in "${papers[@]}";
  do
      echo "preload = ${p}" >> hyprpaper.conf
  done
  echo "wallpaper = ${monitor1},${paper_one}" >>  hyprpaper.conf
  echo "wallpaper = ${monitor2},${paper_two}" >> hyprpaper.conf
  echo "splash = false" >> hyprpaper.conf 

  hyprpaper &
fi
