echo "Preparing chroot ] ${LFS:?}"

chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}

mkdir -pv $LFS/{dev,proc,sys,run}

mknod -m  600 $LFS/dev/console c 5 1
mknod -m  666 $LFS/dev/null c 1 3


bash -e $DIST_ROOT/build_env/build_scripts/mount-virt.sh

chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin     \
    /dist/build_env/build_scripts/fin.sh


bash -e $DIST_ROOT/build_env/build_scripts/umount-virt.sh


