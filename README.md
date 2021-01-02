# Zorin-preseed
This Repository has every file, which is needed to make a preseeded installation of the Zorin OS 15

## Directory "files"
The Directory will be copied to the */home/* directory on the target system. This could be used to make chages on the target system after the installation.

## File "ks.preseed"
This file gives the commands to ubiquity for the preseeded installation.

## File "er.preseed"
This file is nearly identical to the file *ks.preseed*, ther is only one additional command. The command excecute the bash-script "erase.sh". It is excecutet bevor the partioning.

## File "ersus.preseed"
This file is nearly identical to the file *er.preseed*, ther is only one additional command. The command excecute the bash-script "erase_sus.sh". It is excecutet bevor the partioning.

## File "ksap.preseed"
This file is similar to *ks.preseed* but copies to scripts at the end of the installation to the Desktop.

## File "erap.preseed"
This file is similar to *er.preseed* but copies to scripts at the end of the installation to the Desktop.

## File "erapsus.preseed"
This file is similar to *ersus.preseed* but copies to scripts at the end of the installation to the Desktop.

## File "erase.sh"
This file is a bashscript, which search for memorydevices an excecute the *hpdarm.sh* for every of them. Only the last device is excluded, because this is mostly the installmedium.
Because the livesystem, which makes the installation, has the most memorydevices declared as frozen, the script suspends the computer automaticly. It must be "waked up" manually by pressing the power button after the screen turns black.

## File "erase_sus.sh"
This file is the same as *erase.sh*. But the suspend of the computer is removed. This is due to the problem, that some old computers aren't unable to suspend and reawakened.

### File "hpdarm.sh"
This File is a bashscript, which erase a memorydevice. It use *hpdarm*, if it fails, it use *dd* to overwrite the device with random numbers.

## File "menuentries.cfg"
This file is found in the directory *isolinux* of the original image. It is used to generate the bootmenue for the legacy boot. Every bootentry has the ubiquity removed. The installation will be started from the livesystem.

## File "locale"
this file contains the localization of the system. It is copied from a manually installed system. The presseded installation will copy it to the directory */etc/default*. In a single user system will this set the localisation.
At the moment a copy of this file lays in the directory *files* and will be copied a second time trough the personalisation step in the installed system.

## File "grub.cfg"
This file is found in the directory *boot/grub* of the original image. It is used to generate the bootmenue for the EFI boot. The first half of the file for the visual expression and can be ignored. the second part is similar to *menuentries.cfg* and has the same parameters. Every bootentry has the ubiquity removed. The installation will be started from the livesystem.

## File "kamera.sh"
Some Macbooks have problems with the camera-driver. This script reloads a free driver from github and set it up.

## File "kamera.reload.sh"
This script is a reduced version of "script.sh". This is for the time, when the kernel is reinstalled due to the updates. This reload the driver and recompile it.

## Workflow to create an preseeded image

### only the preseeding
1. To modify an existing image, you have to mount the existing image with 'sudo mount -o loop image.img mnt' und copy everything to an existing directory.
2. Now is it possible to make the changes.
3. With the following command you can creat a *.iso* file from the working directory. 

```
mkisofs -D -r -V "UNATTENDED_ZORIN" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o unattanded-Zorin.iso iso
```

### Full
if there should be additional packages installed, the file steps.txt has the commands to do so.

## Workflow of the installation
1. Boot from the Bootdevice.
2. Select the right option. There are four preseeded option and to backup options.
   1. preseeded installation without erasing of the memory devices.
   2. preseeded installation with erasing of the memory devices.
   3. preseeded installation with erasing of the memory devices without suspend.
   4. preseeded installation without erasing of the memory devices for Apple.
   5. preseeded installation with erasing of the memory devices for Apple.
   6. preseeded installation with erasing of the memory devices without suspend for Apple.

## known issues
- The installation isn't fully unattanded. Because of unknown reason is this not possible. There must be minimum one command uncommented.
- The computer restart directly after the installation. So if the bootpriority of USB-devices is higher then the priority of the HDD, the computer could end in an endless lopp of installations. At the moment of the action to continue the installation will be shown, if there are other installed operating systems.
- The language and the keyboardlayout are set to english and en_US. These things are individualized after the installation is finished. 
