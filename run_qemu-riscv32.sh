
# https://github.com/s-macke/jor1k/wiki/How-to-develop-for-jor1k

# install the binfmt packages on your system and provide the kernel the or1k binary header details.


sudo mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc
# sudo touch /proc/sys/fs/binfmt_misc/register
sudo chmod 777 /proc/sys/fs/binfmt_misc/register

# sudo echo ":qemu-or1k:M:0:\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x5c:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/bin/qemu-or1k-static:OC" > /proc/sys/fs/binfmt_misc/register

# https://stackoverflow.com/questions/17813850/binfmt-support-not-allowing-me-to-echo-to-register

# https://github.com/darchr/riscv-full-system/blob/main/qemu.md
# sudo echo "echo ':qemu-riscv32:M:0:\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-riscv32-static:OC' > /proc/sys/fs/binfmt_misc/register" | sudo sh

# https://dev.to/asacasa/howto-setup-qemu-risv64-static-magic-for-binfmtmisc-on-ubuntu-2004-focal-2jp6
# sudo echo ':qemu-riscv64:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-riscv64-static:CF'

# sudo echo "echo ':qemu-riscv32:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-riscv32-static:CF' > /proc/sys/fs/binfmt_misc/register" | sudo sh


# sudo echo "echo ':qemu-riscv32:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff:/usr/bin/qemu-riscv32-static:CF' > /proc/sys/fs/binfmt_misc/register" | sudo sh
# 7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00

sudo echo "echo ':qemu-riscv32:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff:/usr/bin/qemu-riscv32-static:OC' > /proc/sys/fs/binfmt_misc/register" | sudo sh

# To improve the compatibility execute the following commands:
sudo cp /etc/resolv.conf sysroot/etc/
sudo mount -t proc none sysroot/proc
sudo mount -t sysfs none sysroot/sys
sudo mount -o bind /dev sysroot/dev
sudo mount -o bind /dev/pts sysroot/dev/pts

# Enter the chroot environment
# sudo chroot sysroot /usr/bin/qemu-riscv32-static -E PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin /bin/busybox sh -c '/bin/busybox mkdir /bin2; for i in $(/bin/busybox --list); do /bin/busybox ln -s /bin/busybox /bin2/$i; done; /bin/busybox sh -li'

sudo chroot sysroot /usr/bin/qemu-riscv32-static -E PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin /bin/busybox sh -c '/bin/busybox chmod 77 /home/rebooting-riscv32; /bin/busybox sh /home/rebooting-riscv32'


