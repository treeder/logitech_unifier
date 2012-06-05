Logitech Unifier
================

A program to pair devices to a Logitech Unifying Receiver on Linux.

Logitech only provides a Windows program to do this, so if you're running Linux, you either need to pair your 
devices on a windows box or use the unify.c script. 

How To
----------------

1\. Compile it

    gcc -o unify unify.c

2\. Find your hidraw device

To find it, run the following for every hidrawX on your system until you find `HID_NAME=Logitech USB Receiver`:

    cat /sys/class/hidraw/hidraw0/device/uevent
    
If hidraw0 isn't it, try hidraw1 and so on.

3\. sudo ./unify /dev/hidrawX

4\. Turn on your device like the tool will say.

That's it!  Device should work now. 

Thanks
------

To Tycho for this article: http://tycho.ws/blog/2011/12/logitech-unifying-receiver

And Benjamin for writing the script: https://groups.google.com/forum/?fromgroups#!msg/linux.kernel/zYS6yddI8yU/9cMvg3k9xTYJ
