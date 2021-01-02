#!/bin/bash
gsettings set com.zorin.desktop.auto-theme day-theme ZorinGrey-Light
gsettings set org.gnome.shell favorite-apps "['yelp.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'firefox.desktop', 'org.gnome.Evolution.desktop', 'libreoffice-writer.desktop', 'libreoffice-calc.desktop', 'libreoffice-impress.desktop', 'skypeforlinux.desktop', 'Zoom.desktop']"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'ch')]"
gsettings set org.gnome.system.locale region "de_CH.UTF-8"
#sudo cp /home/files/locale /etc/default/locale
sudo timedatectl set-timezone Europe/Berlin
#sudo reboot
bash /home/files/hintergrund.sh
