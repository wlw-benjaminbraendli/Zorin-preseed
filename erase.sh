#!/bin/bash
echo "start erase"
systemctl suspend
sleep 20
list=$(lsblk | grep -o "sd"[a-z] | uniq)
declare -a liste
for i in $list
  do
    liste+=($i)
done
unset 'liste[${#liste[@]}-1]'
for i in "${liste[@]}"
  do
    sudo bash /cdrom/hdparm.sh /dev/$i
done

list=$(lsblk | grep -o "nvme"[0-9][a-z][0-9] | uniq)
declare -a liste1
for i in $list
  do
    liste+=($i)
done
#unset 'liste1[${#liste1[@]}-1]'
for i in "${liste1[@]}"
  do
    sudo bash /cdrom/hdparm.sh /dev/$i
done

