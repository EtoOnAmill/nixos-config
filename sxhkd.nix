{
  enable = true;
  keybindings = {
# reloads sxhkd config
      "super + Escape" = "pkill -USR1 -x sxhkd";

# launch terminal
      "super + @space" = "urxvt";

# launch firefox
      "super + Tab" = "firefox";

# graphical audio manager
      "super + a" = "pavucontrol";

# media player
      "super + shift + a" = "audacious";

# screenshots
      "Print" = "gscreenshot";

# change keyboard language
      "super + shift + z" = "setxkbmap rs latinunicodeyz";
      "super + z" = "setxkbmap it";

# console scratchpad
      "super + c" = "/home/etonit/.config/sxhkd/openScratchpad.sh";

# virt-manager
      "super + w" = "wpa_gui";

# virt-manager
      "super + v" = "virt-manager";

# setup everything
      "super + alt + r" = "$HOME/.config/bspwm/bspwmrc";

#
# BSPWM HOTKEYS
#


# quit or restart bspwm
      "super + alt + x" = "bspc quit";

# kill window
      "super + {_,control +}x ; super + {_,control +}x " = "bspc node -{c,k}";

# alternate between tile and fullscreen
      "super + f" = "bspc desktop -l next";

# swap with current biggest window
      "super + s" = "spotify";

# change focus in the given direction
      "super + {h,j,k,l}" = "bspc node -f {west,south,north,east}";

# swap in the given direction
      "super + shift + {h,j,k,l}" = "bspc node -s {west,south,north,east}";

# change focus in the given direction
      "alt + shift + {h,j,k,l}" = "bspc node -n {west,south,north,east}";

#preselec splitting 
      "super + alt + {h,j,k,l}" = "bspc node -p ~{west,south,north,east} && kitty";

# switch brothers
      "super + b" = "bspc node -s @brother";

# rotate nodes
      "super + p" = "bspc node -f @parent && bspc node -R 90 && bspc node -f older.local";

# change focus between desktops
      "super + ctrl + {1,2,3,4,5,6,7,8,9,0}" = "bspc desktop -f {I,II,III,IV,V,VI,VII,VIII,IX,X} ";

# change focus between desktops
      "super + {1,2,3,4,5,6,7,8,9,0}" = "xrandr --output eDP-1-1 --brightness {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0} ";

# slide between desktops
      "super + ctrl + {h,j,k,l}" = "bspc desktop -f {prev,I,VI,next}";

# slide between desktops
      "super + ctrl + alt + {h,j,k,l} " = "bspc node -d {prev,I,VI,next} --follow";
  };
}
