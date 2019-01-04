#!/bin/sh

qemu-system-mips                                        \
  -M malta                                              \
  -m 2048                                               \
  -hda hda.img                                          \
  -kernel vmlinux-4.9.0-8-4kc-malta                     \
  -initrd initrd.img-4.9.0-8-4kc-malta                  \
  -append "root=/dev/sda1 console=ttyS0 nokaslr"        \
  -nographic                                            \
  -no-reboot                                            \
  -device e1000-82545em,netdev=user.0                   \
  -netdev user,id=user.0,hostfwd=tcp:127.0.0.1:2222-:22
