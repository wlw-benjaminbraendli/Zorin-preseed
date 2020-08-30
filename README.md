# Zorin-preseed
This Repository has every file, which is needed to make a preseeded installation of the Zorin OS 15

## Directory "files"
The Directory will be copied to the */home/* directory on the target system. This could be used to make chages on the target system after the installation.

## File "ks.preseed"
This file gives the commands to ubiquity for the preseeded installation. The most of the commands are read from a installed system and saved in the file. At the end of the file are the personalised commands.

## File "er.preseed"
This file is nearly identical to the file *ks.preseed*, ther is only one additional command. The command excecute the bash-script "erase.sh". It is excecutet bevor the partioning.

## File "erase.sh"
This file is a bashscript, which search for storagedevices an excecute the *hpdarm.sh* for every of them. Only the last device is excluded, because this is mostly the installmedium.

### File "hpdarm.sh"
This File is a bashscript, which erase a storagedevice. It use *hpdarm*, if it fails, it use *dd* to overwrite the device with random numbers.

## File "menuentries.cfg"
This file is found in the directory *isolinux* of the original image. It is used to generate the bootmenue for the legacy boot.

## File "loopback.cfg"
This file is found in the directory *boot/grub* of the original image. It is used to generate the bootmenue for the EFI boot.

## Workflow
	1. To modify an existing image, you have to mount the existing image und copy everything to an existing directory.
	2. Now is it possible to make the changes.
	3. With the following command you can creat a *.iso* file from the working directory. 

"""
mkisofs -D -r -V "UNATTENDED-ZORIN" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -noemul-boot -boot-load-size 4 -boot-info-table -o /tmp/Zorin-unattanded.iso /opt/ubuntuiso
"""

