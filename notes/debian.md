# Debian
I'm used to CentOS / Red Hat, so Debian needs some learnin'.

## But first, a note on WSL
Windows Subsystem for Linux was an absolute disaster. It stopped the PC itself from booting... but even more frustratingly it was totally inconsistent. Sometimes reboots would work, sometimes they'd fail, and sometimes powering off entirely then booting up wouldn't work. Apparently this is a known issue, but I should have known better. Ugh... Next idea? Run Debian as a VM inside VMWare Player.

## VMWare (Debian 10 "buster")
Need something simple and known to work well. Need a hard drive, need a way to share between host OS (Win 10) and guest OS (I chose Debian).
- 25GB drive, single / partition (no lvm)
- 4GB RAM, 2 processors (I forget how CPUs work or should be setup with VM's)
- the netinstall iso works nicely (which means networking didn't need anything weird)

Setting up the shared folder was strange:
- vmware's settings for the vm -> set a Win 10 folder to be shared to Debian
- but for guest OS to see the folder, it needs vmware tools installed
--> package "open-vm-tools" (shouldn't need open-vm-tools-desktop)
- AND THEN you need to run a command to actually mount any shares in the guest?
  # mkdir -vp /mnt/vmshares
  # /usr/bin/vmhgfs-fuse .host:/ /mnt/vmshares -o subtype=vmhgfs-fuse,allow_other
- and add this line to /etc/fstab (assuming /mnt/vmshares is created, and your uid/gid is 1000):
  .host:/ /mnt/vmshares fuse.vmhgfs-fuse allow_other,uid=1000,gid=1000,auto_unmount,defaults 0 0

make sure this is in .bashrc:
  export EDITOR=vim

## Commands

### Packages
```
# apt update
# apt upgrade
  - need both... update does cache, upgrade installs new pkgs

# apt list --installed
# apt install curl build-essential vim open-vm-tools
```

### Runlevels (init) -> Targets (systemd)
This is a systemd thing, not a Debian thing. But I'm in a Debian VM, so notes are going in here.
```
Used to be runlevels, now there's targets. So you set the default target. Lines up kinda like this:
  runlevel => target
    0 => poweroff.target
    1 => rescue.target
  2-4 => multi-user.target
    5 => graphical.target
    6 => reboot.target

Switch between default targets:
  # systemctl set-default multi-user.target
  -> or graphical.target
  -> then reboot (isolate is inconsistent, better to reboot)

Show current default target?
  # ls -l /etc/systemd/system/default.target
  -> this is a symlink to the target
  -> not sure this is the best way

For scripts, this can check if a target (like graphical) is active:
  # systemctl show -p ActiveState graphical.target
  -> shows this: ActiveState=active
  -> or this:    ActiveState=inactive

List the targets:
  # systemctl list-units --type target
```

### Console Fonts
Well, the multi-user works. But the console font looks terrible.
```
steps

List console fonts
- look in dirs? /usr/share/consolefonts/

run this?
  # dpkg-reconfigure console-setup
  to configure console font
  then
  # setupcon
  which activates the changes

you can try:
  # showconsolefont
  which shows the character set for the active font

Example /etc/default/console-setup
ACTIVE_CONSOLES="/dev/tty[1-6]"
CHARMAP="UTF-8"
CODESET="guess"
FONTFACE="TerminusBold"
FONTSIZE="16x32"
SCREEN_WIDTH="80"
- this restricts width to 80 columns
- and fontface / fontsize come from font's filename, which is reverse
  so this file is: TerminusBold32x16.psf.gz

```