# FreedomOS - ADXDA Edition

![alt text](assets/media/banners/FreedomxADXDA.png)

## About ADXDA Edition

FreedomOS, resurrected. Everything you knew and loved is back for more

## Community

Become a part of the community by joining the [FreedomOS ADXDA Discord](https://discord.gg/pgxRgXJ). Keep up to date with the latest releases and help to test and contribute to the project.

## Required
- Linux x64 (others architectures are not currently supported).
- 30GiB of free space or more.
- Optional packages:
- `adb` for pulling updated apps and pushing rom with automatic flash.
- `java` for signed the zip file.
- `aria2` for paralleled download.

Arch based:
```
pacman -S python python2 zip curl openssl ncurses cpio python-virtualenv unzip binutils lzip
```

Debian/Ubuntu based:
```
apt-get install python zip curl openssl libncurses-dev cpio python-virtualenv gawk binutils lzip
```

## How to build

IT IS KNOWN THAT THERE CAN BE ISSUES AT THIS TIME COMPILING USING THE GIT SOURCE. WE ARE WORKING ON RECTIFYING THE ISSUE.

Clone all the required repos:
```bash
git clone --recursive https://github.com/aaronduce/FreedomOS-adxda.git
```
To update all the repos:
```bash
git pull --recurse-submodules
```
Build the rom with the interactive menu:
```bash
bash build.sh
```

Or build the rom with the one line command:

`<device>`: to get the list of the available devices just type `ls device`  
`<version>`: anything you wan want (e.g 1.0)  
`<build_type>`: put your developer name for public release, or `debug` for testing (e.g nevax)  
In order to build a public release build, you need to generate your own private keys (see gitlab Wiki)
```bash
bash  build.sh -d <device> -v <version> -t <build_type>
# example
bash  build.sh -d OnePlus5 -v 1.0 -t adxda
```

It will download all the needed files and start building your project.

If you forget to pull the submodules, run this command:
```bash
git submodule update --init --recursive
```

## Credits
- [Nevax07](https://gitlab.com/Nevax/FreedomOS) - For the original ROM build
- [kickoff](https://forum.xda-developers.com/member.php?u=498688) - For the aroma theme
- [Chainfire](https://forum.xda-developers.com/member.php?u=631273) - For SuperSU
- [amarullz](https://forum.xda-developers.com/member.php?u=402300) - For aroma project and the themes
- [topjohnwu](https://forum.xda-developers.com/member.php?u=4470081) - For Magisk
- [rovo89](https://forum.xda-developers.com/member.php?u=4419114) - For Xposed Installer
- [DVDandroid](https://forum.xda-developers.com/member.php?u=5345056) - For Xposed Installer
- [xpirt](https://forum.xda-developers.com/member.php?u=5132229) - For img2sdat
- [A.R.I.S.E. Sound Systems](https://forum.xda-developers.com/member.php?u=7433324) - For Sound Tweaks and Systems
- [The Open GApps Project](https://opengapps.org) - For Google Apps
- [Tolyan and other Google Camera Port Developers](https://forum.xda-developers.com/oneplus-3/how-to/modded-google-camera-hdr-60fps-video-t3658552) - For the Google Camera Port
- [Pexels Artists and Photographers](https://www.pexels.com) - For some of the background images

## Join the team
You can join our teams for testing (if you have one of our supported or planned to be supported devices). 

[Discord](https://discord.gg/pgxRgXJ)

[XDA thread](http://forum.xda-developers.com/oneplus-3/development/rom-freedomos-1-0-t3409348)
