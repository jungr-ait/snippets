# GDB


## ptrace: Operation not permitted.

```
ptrace: Operation not permitted.

Could not attach to the process. Make sure no other debugger traces this process.
If your uid matches the uid
of the target process, check the settings of
/proc/sys/kernel/yama/ptrace_scope
For more details, see /etc/sysctl.d/10-ptrace.conf
```

Solution:

```
The recommended way to enable the needed ptrace kernel setting (hinted by qtcreator) is to edit /etc/sysctl.d/10-ptrace.conf

sudo vim  /etc/sysctl.d/10-ptrace.conf

Then change

kernel.yama.ptrace_scope = 1

to

kernel.yama.ptrace_scope = 0

Save,

then apply:

$ sudo sysctl --system -a -p|grep yama
```
