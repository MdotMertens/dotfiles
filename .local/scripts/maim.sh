output=$HOME/Pictures/screenshots/"$(date +%s_%h%d_%H:%M:%S).png"

case "$1" in
    "select") maim -s "$output" || exit;;
    "selectclipboard") maim -s | xclip -selection clipboard -t image/png;;
esac
