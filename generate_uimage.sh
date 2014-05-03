#!/bin/bash

# XXX: needs to get replaced by a Makefile rule!

cd platform-dockstar/images
cat linuximage kirkwood-dockstar.dtb > zImage
mkimage \
    -A arm \
    -O linux \
    -C none \
    -T kernel \
    -a 0x00008000 \
    -e 0x00008000 \
    -n 'Linux-3.12.18' \
    -d zImage \
    uImage
