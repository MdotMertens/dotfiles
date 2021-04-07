output=$HOME/Pictures/screenshots/"$(date +%F_%T).png"



case "$1" in
    "select") maim -s "$output" || exit;;
    "selectclipboard") maim -s | xclip -selection clipboard -t image/png;;
    "wholescreenclipboard") maim | xclip -selection clipboard -t image/png;;
esac
