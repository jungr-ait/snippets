# UBUNTU

## Linux bash history with Page up / Page down

In /etc/inputrc, uncomment:
```
# alternate mappings for "page up" and "page down" to search the history
"\e[5~": history-search-backward
"\e[6~": history-search-forward
```

Restart your shell or use Ctrl+X, Ctrl+R to tell it to re-read.

## Bookmark in nautilus

navigate to the desired folder and press `ctrl + shift + d`. After that the folder should appear in the left side below the partitions/storages. 
With `ctrl + b` bookmarks can be edited. 


## Serial terminal

```
sudo apt install moserial
```

Add the user to the group `dailout`.


The issue with the permissions for /dev/ttyACM0 can be permanantly solved by adding yourself to the dialout group. You will have to logout and then log back in before the group change is recognized.

You can do this with `sudo usermod -a -G dialout $USER`

## CMake toolchain files and info found here:

https://github.com/zyga/cmake-toolchains

## INXI  - show system hardware

```
sudo apt install inxi
inxi -Fxz
```

## Graphics information

```
lspci -k | grep -EA2 'VGA|3D'
```

## Dell Graphics issue

https://www.dell.com/support/article/at/de/atbsdt1/sln298431/a-guide-to-nvidia-optimus-on-dell-pcs-with-an-ubuntu-operating-system?lang=en

## Turn touchpad ON/OFF



To turn off touch pad:

`synclient TouchpadOff=1`

To turn it back on:

`synclient TouchpadOff=0`

