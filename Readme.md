# Test your favourite software on a big-endian machine

Using the MIPS architecture from QEMU we can test software on a big-endian
architecture without hassle. This guide fully automates the required steps for
producing a debian stretch OS running on a virtualized MIPS Malta processor.

Create disc image with enough space

```
qemu-img create -f qcow2 hda.img 50G
```

Install debian stretch into that image using preseeding (takes a while!).
Requires a DHCP server and network access.
If you are lazy grab the resulting image from
[here](https://byte-physics.de/public-downloads/debian-mips-qemu/hda.img) and
skip that step.

```
./install.sh
```

Startup your new OS


```
./start.sh
```

Connect via ssh from your terminal (user: debian, password: debian)

```
ssh -p 2222 debian@127.0.0.1
```

and start hacking on your big-endian machine


```
debian@debian:~$ lscpu
Architecture:          mips
Byte Order:            Big Endian
CPU(s):                1
On-line CPU(s) list:   0
Thread(s) per core:    1
Core(s) per socket:    1
Socket(s):             1
BogoMIPS:              995.32
```

That's it!

Resources:
- https://markuta.com/how-to-build-a-mips-qemu-image-on-debian/
- https://wiki.qemu.org/Documentation/Networking
- https://wiki.debian.org/DebianInstaller/Preseed
- https://www.debian.org/releases/stable/amd64/apbs02.html.en
