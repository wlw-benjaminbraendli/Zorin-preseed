#!/bin/bash
sudo cp /home/files/zz_Titelbild.png /home/user/Bilder/
gsettings set org.gnome.desktop.screensaver picture-uri /home/user/Bilder/zz_Titelbild.png
gsettings set org.gnome.desktop.background picture-uri /home/user/Bilder/zz_Titelbild.png
gsettings set org.gnome.shell.extensions.user-theme name "ZorinGrey-Dark"
gsettings set com.zorin.desktop.auto-theme night-theme "ZorinGrey-Dark"
gsettings set org.gnome.desktop.interface gtk-theme "ZorinGrey-Dark"
gsettings set org.gnome.desktop.interface icon-theme "ZorinGrey-Dark"
sudo mv /home/kamera.reload.sh /home/user/Schreibtisch
sudo mv /home/kamera.sh /home/user/Schreibtisch
sudo chown user /home/user/Schreibtisch/kamera.sh
sudo chown user /home/user/Schreibtisch/kamera.reload.sh
sudo chgrp user /home/user/Schreibtisch/kamera.sh
sudo chgrp user /home/user/Schreibtisch/kamera.reload.sh
sudo chmod 777 /home/user/Schreibtisch/kamera.sh
sudo chmod 777 /home/user/Schreibtisch/kamera.reload.sh

#start benchmark
sudo bash /home/files/bench.sh
sudo rm -r /home/files

#remove crontab
sudo sed '$d' /var/spool/cron/crontabs/root > foo
sudo crontab foo
sudo rm foo
