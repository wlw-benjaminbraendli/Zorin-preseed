# Zorin-preseed
This Repository has every file, which is needed to make a preseeded installation of the Zorin OS 15

Every file in the directory "files" is copied to the targetsystem after a successfull installation of the OS. The directory is located in the "/home/" directory of the final system.

The file "ks.preseed" has the commands for ubiquity to install the system unattended. The most of the commands are read from a installed system and saved in the file. At the end of the file are the personalised commands.

The file "er.preseed" is the same, only one command is additional. The command excecute the bash-script "erase.sh". This script clean every found storagge, except the installmedium.

The file "erase.sh" is a bashscript excecuted from the er.preseed installation. It search for storagge and start for every of these the file "hpdarm.sh". The last storage will be excluded of the cleaning, because ist is the installdevice.

The file "hpdarm.sh" is a bashscript, which clean a storagedevice. It tries to use the hpdarm software. If it fails, every bit of the storage will be overwritten with a random number.

The file "menuentries.cfg" could be found in the directory "isolinux" and manage the bootmenue for legacy boot.

The file "loopback.cfg" could be found in the directory "boot/grub" and manage the bootmenue for EFI boot.

