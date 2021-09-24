# Debian
I'm used to CentOS / Red Hat, so Debian needs some learnin'.

## Commands

### Weird stuff
To use vim automatically for certain tasks, set this in your .bashrc:
  `export EDITOR=vim`

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