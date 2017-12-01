# Linux bash history with Page up / Page down

In /etc/inputrc, uncomment:
```
# alternate mappings for "page up" and "page down" to search the history
"\e[5~": history-search-backward
"\e[6~": history-search-forward
```

Restart your shell or use Ctrl+X, Ctrl+R to tell it to re-read.

## Serial terminal

```
sudo apt install moserial
```

Add the user to the group `dailout`.


The issue with the permissions for /dev/ttyACM0 can be permanantly solved by adding yourself to the dialout group. You will have to logout and then log back in before the group change is recognized.

You can do this with `sudo usermod -a -G dialout $USER`
