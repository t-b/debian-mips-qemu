#!/bin/sh

URL=http://byte-physics.de/public-downloads/debian-mips-qemu/preseed.txt
OPTS="console=ttyS0 nokaslr priority=critical auto=true preseed/url=${URL}"

qemu-system-mips                      \
  -M malta                            \
  -m 2048                             \
  -hda hda.img                        \
  -kernel vmlinux-4.9.0-8-4kc-malta   \
  -initrd initrd.gz                   \
  -append "${OPTS}"                   \
  -nographic                          \
  -no-reboot                          \
  -device e1000-82545em,netdev=user.0 \
  -netdev user,id=user.0
