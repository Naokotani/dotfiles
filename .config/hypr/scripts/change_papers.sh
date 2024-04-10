cd "/home/naokotani/.config/hypr/scripts/"

dir="/home/naokotani/Pictures/wallpapers/"
response=$( ls $dir  | wofi --exec-search --dmenu);
echo $response

echo "/home/naokotani/Pictures/wallpapers/${response}/" > wallpapers_dir.conf

pkill -9 hyprpaper

./start_paper.sh
