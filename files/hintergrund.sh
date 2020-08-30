#!/bin/bash
sudo cp /home/files/zz_Titelbild.png /home/user/Bilder/
gsettings set org.gnome.desktop.screensaver picture-uri /home/user/Bilder/zz_Titelbild.png
gsettings set org.gnome.desktop.background picture-uri /home/user/Bilder/zz_Titelbild.png
gsettings set org.gnome.shell.extensions.user-theme name "ZorinGrey-Dark"
gsettings set com.zorin.desktop.auto-theme night-theme "ZorinGrey-Dark"
gsettings set org.gnome.desktop.interface gtk-theme "ZorinGrey-Dark"
gsettings set org.gnome.desktop.interface icon-theme "ZorinGrey-Dark"
sudo rm -r /home/files
