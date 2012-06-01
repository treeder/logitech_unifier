logitech_unifier
================

A program to pair devices to a Logitech Unifying Receiver on Linux.

How To
----------------

1\. Compile it

    gcc -o unify unify.c

2\. Find your hidraw device

To find it, run the following for every hidrawX on your system until you find `HID_NAME=Logitech USB Receiver`:

    cat /sys/class/hidraw/hidraw0
    
If hidraw0 isn't it, try hidraw1 and so on.

3\. Turn on your device like the tool will say.

That's it!  Device should work now. 

Thanks
------

To Tycho for this article: http://tycho.ws/blog/2011/12/logitech-unifying-receiver

And Benjamin for writing the script: https://groups.google.com/forum/?fromgroups#!msg/linux.kernel/zYS6yddI8yU/9cMvg3k9xTYJ
