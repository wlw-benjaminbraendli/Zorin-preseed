# Zorin-preseed
This Repository has every file, which is needed to make a preseeded installation of the Zorin OS 15

## Directory "files"
The Directory will be copied to the */home/* directory on the target system. This could be used to make chages on the target system after the installation.

## File "ks.preseed"
This file gives the commands to ubiquity for the preseeded installation. The most of the commands are read from a installed system and saved in the file. At the end of the file are the personalised commands.

## File "er.preseed"
This file is nearly identical to the file *ks.preseed*, ther is only one additional command. The command excecute the bash-script "erase.sh". It is excecutet bevor the partioning.

## File "erase.sh"
This file is a bashscript, which search for memorydevices an excecute the *hpdarm.sh* for every of them. Only the last device is excluded, because this is mostly the installmedium.

### File "hpdarm.sh"
This File is a bashscript, which erase a memorydevice. It use *hpdarm*, if it fails, it use *dd* to overwrite the device with random numbers.

## File "menuentries.cfg"
This file is found in the directory *isolinux* of the original image. It is used to generate the bootmenue for the legacy boot.

## File "loopback.cfg"
This file is found in the directory *boot/grub* of the original image. It is used to generate the bootmenue for the EFI boot.

## Workflow to create an preseeded image
	1. To modify an existing image, you have to mount the existing image und copy everything to an existing directory.
	2. Now is it possible to make the changes.
	3. With the following command you can creat a *.iso* file from the working directory. 

```
mkisofs -D -r -V "UNATTENDED-ZORIN" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -noemul-boot -boot-load-size 4 -boot-info-table -o /tmp/Zorin-unattanded.iso /opt/ubuntuiso
```

## Workflow of the installation
1. Boot from the Bootdevice.
2. Select the right option. There are four preseeded option and to backup options.
   1. preseeded installation without erasing of the memory devices.
   2. preseeded installation with erasing of the memory devices.
   3. preseeded installation without erasing of the memory devices with additional nvidia drivers
   4. preseeded installation with erasing of the memory devices with additional nvidia drivers
   5. livesystem which boot to RAM. This makes it possible to remove the installationdevice after the completed boot
   6. "normal" livesystem with the option to install the OS whitout preseeding

##known issues
- The installation isn't fully unattanded. Because of unknown reason is this not possible. There must be minimum one command uncommented.
- Most times *hpdarm* stops, because the device is "frozen". An easy way to solve this is to suspend the Computer. Mostly there is a key to send the computer to suspention. Otherwise is there the option to fold up the laptop. This should be done, as soon as the ubiquity window is displayed. The *erase.sh* script slepps 20 seconds after the start, to give enough time to react and to suspend the computer.
- The computer restart directly after the installation. So if the bootpriority of USB-devices is higher then the priority of the HDD, the computer could end in an endless lopp of installations. At the moment of the action to continue the installation will be shown, if there are other installed operating systems.
- The language and the keyboardlayout are set to english and en_US. These things are individualized after the installation is finished. 
- Both bootoption for nvidia test for compatible graphiccards. Is no card found will the bootmenue reappear.
