cd "/home/naokotani/.config/hypr/scripts/"

echo "/home/naokotani/Pictures/wallpapers/${response}/" > wallpapers_dir.conf

pkill -9 hyprpaper

./start_paper.sh
