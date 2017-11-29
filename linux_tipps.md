# Linux bash history with Page up / Page down

In /etc/inputrc, uncomment:
# alternate mappings for "page up" and "page down" to search the history
"\e[5~": history-search-backward
"\e[6~": history-search-forward

Restart your shell or use Ctrl+X, Ctrl+R to tell it to re-read.

