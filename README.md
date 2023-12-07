# Linux-Kernel-Debugging

## Download Kernel
First thing we gonna download a source code The Linux Kernel Archives. 

## enable a module
next going into a folder just donwloaded. next ```make menuconfig``` for enable a tracing module in kernel hacking

## compile
this step we gonna use ```make``` on top folder. (it take a long time for compiled).

## install the kernel module to local device.
we will use 
```
sudo make modules_install
```

## install the new kernel image (copy the new kernel image to the '/boot' directory and update the bootloader configuration)
we use 
```
sudo make install
```

## Reboot
when done all you should reboot your system .
```
sudo reboot
```

just in case, if 'make install' do not automatically update your bootloader configutation. for GRUB use 
```
sudo update-grub
```

