# FreedomOS - ADXDA Edition

![alt text](assets/media/banners/FreedomxADXDA.png)

## Community

Become a part of the community by joining the [FreedomOS ADXDA Discord](https://discord.gg/pgxRgXJ). Keep up to date with the latest releases and help to test and contribute to the project.

## Credits
- [Nevax07](https://gitlab.com/Nevax/FreedomOS) - For the original ROM build

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

## Join the team
You can join our teams for testing (if you have one of our supported or planned to be supported devices). 

[Discord](https://discord.gg/pgxRgXJ)

[XDA thread](http://forum.xda-developers.com/oneplus-3/development/rom-freedomos-1-0-t3409348)
