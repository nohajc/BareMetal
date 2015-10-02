#!/bin/sh

cd src/Pure64
./build.sh
cd -
mv src/Pure64/*.sys bin/

cd src/BareMetal-OS/os
nasm kernel64.asm -o kernel64.sys
cd -
mv src/BareMetal-OS/os/kernel64.sys bin/
