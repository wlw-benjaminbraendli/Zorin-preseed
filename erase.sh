#!/bin/bash
echo "start erase"
sleep 20
list=$(ls /dev | grep "sd"[a-z]$)
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

list=$(ls /dev | grep "nvme"[0-9][a-z][0-9]$)
declare -a liste
for i in $list
  do
    liste+=($i)
done
#unset 'liste[${#liste[@]}-1]'
for i in "${liste[@]}"
  do
    sudo bash /cdrom/hdparm.sh /dev/$i
done

