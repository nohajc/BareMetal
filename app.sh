#!/bin/sh
cd src/BareMetal-OS/programs/
#nasm $1.asm -o ../../../bin/$1.app
nasm $1.asm -o $1.app
cd -
mv src/BareMetal-OS/programs/$1.app bin/

if [ $? -eq 0 ]; then
cd bin
./bmfs bmfs.image create $1.app 2
./bmfs bmfs.image write $1.app
cd ..
else
echo "Error"
fi
