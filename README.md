# Manjaro on Mac

This repo lists notes for setting up and installing Manjaro Linux on a MacBook Air (13-inch, Mid 2013).
The machine is running macOS Mojave 10.14.6 (18G1012) at time of install.

## 1. Backing up OSX
Make sure to have a back up of OSX. Use Time Machine if necessary.

## 2. Partitioning the hard drive
First step is to create a partition for Linux to run on.
If Disk utility lists a large amount of purgeable data, try filling up the hard drive to almost full capacity by running

```dd if=/dev/random of=/my/large/file bs=100m```

and `cp`ing this file as necessary. OSX won't let the main drive be partitioned if Time Machine is running. Run

```tmutil disable```

Then partition the drive with Disk Utility. It may also be a good idea to remove the local Time Machine snapshots by running

```$ listlocalsnapshots```

```$ tmutil thinlocalsnapshots / 10000000000 1```

```$ tmutil deletelocalsnapshots (date)```

if Disk utility is stubborn and doesn't let the drive be partitioned.

Make sure to re-enable Time Machine with

```$ tmutil enable```

Start Disk utility and create a new partition for the linux install. The filesystem doesn't really matter for now.

## 3. Installing Manjaro
Boot on the live USB. Insatll Manjaro. Use "Replace partition", Manjaro will install the bootloader on /dev/sda1. We'll split the home partition later.

## 4. Update repo mirrors, packages and install basic utilities
```$ pacman-mirrors -f```

```$ pacman -S gparted yay libinput-gestures```

```$ yay -Syyu ```

Enable libinput-gestures autostart:

```$ libinput-gestures-setup autostart```

Add user to the input group:

```$ sudo gpasswd -a $USER input```

Upgrade kernel: start Manjaro Settings Manager, download the latest LTS kernel (linux-5.4 if desired). Reboot into Manjaro, holding Esc during boot sequence. Select desired kernel and restart.

## 6. Install zsh, oh-my-zsh and z

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```

```wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh```

## 5. Install the wifi drivers
```$ yay -S linux-headers broadcom-wl-dkms```

```$ rmmod b43 b43legacy ssb bcm43xx brcm80211 brcmfmac brcmsmac bcma wl```

```$ modprobe wl```


## 6. Split root partition and /home
Open gparted from live USB. Create a new partition that will hold /home. Reboot.

Add the partition to fstab: Start by searching the UUID:

```$ sudo blkid```

Add thissudo gpasswd -a $USER input line to ```/etc/fstab```

```UUID=<UUID> /home ext4 nodev,nosuid 0 2```

and mount the partition

```$ mkdir /mnt/home_new && mount /dev/partition /mnt/home_new```

Copy /home/ to the new partition and unmount

```$ cp -Rp /home/* /mnt/home_new && umount /dev/partition``

Finally rename and delete the old home

```mv /home /home_old && mkdir /home```

Reboot and remove /home_old:

```$ rm -rf /home_old```

## 7. Create swapfile
Allocate file for swapfile

```$ fallocate -l 5G /swapfile && chmod 600 /swapfile```

Mark file as swap space and enable

```$ mkswap /swapfile && swapon /swapfile```

Check

```$ swapon --show```

Make changes permanent

```$ echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab```

## 8. Enable power management

Enable sensors

```$ sensors-detect```

```$ sensors```

Install thermald and tlpui

```$ yay -S thermald tlpui```

Enable thermald and tlpui

```$ systemctl enable --now tlp```

```$ systemctl enable --now tlp-sleep.service```

```$ systemctl enable --now thermald```

## 9. Resetting touchpad after hibernating

```/etc/systemd/system/my_user_script.service```
