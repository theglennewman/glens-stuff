# VMWare for Linux on Windows

## WSL
Windows Subsystem for Linux was an absolute disaster. It stopped the PC itself from booting... but even more frustratingly it was totally inconsistent. Sometimes reboots would work, sometimes they'd fail, and sometimes powering off entirely then booting up wouldn't work. Apparently this is a known issue, but I should have known better. Ugh... Next idea? Run Debian as a VM inside VMWare Player.

## VMWare

### VM Setup
- Host is my Windows 10 PC
- Guest OS: Debian 10 "buster"
- 25GB drive, single / partition (no lvm)
- 4GB RAM, 2 processors
- no special steps for networking, netinstall iso worked well

### Shared Folder
This ended up being a little tricky.

In VMWare's settings for the VM:
- specify a Win 10 folder to be shared to Debian

Guest OS:
- ensure the vmware tools is installed in the guest OS...
- package "open-vm-tools" (shouldn't need open-vm-tools-desktop)
- I wanted to use this dir for mounting the shared folder:
	# mkdir -vp /mnt/vmshares
- then use this command to actually mount the share:
	# /usr/bin/vmhgfs-fuse .host:/ /mnt/vmshares -o subtype=vmhgfs-fuse,allow_other
- to mount automatically, add this /etc/fstab:
  .host:/ /mnt/vmshares fuse.vmhgfs-fuse allow_other,uid=1000,gid=1000,auto_unmount,defaults 0 0
  # note /mnt/vmshares dir must exist, make sure to use your uid / gid for permissions

make sure this is in .bashrc:
  export EDITOR=vim