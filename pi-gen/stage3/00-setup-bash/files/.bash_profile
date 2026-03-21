source ~/.profile

# print ascii art
cat ~/logo.txt
echo ""

# start window manager
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi
