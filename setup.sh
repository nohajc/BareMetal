#!/bin/sh

if [ ! -d "$src" ]; then
  mkdir src
fi
cd src
git clone https://github.com/ReturnInfinity/BMFS.git
git clone git@github.com:nohajc/Pure64.git
git clone git@github.com:nohajc/BareMetal-OS.git
cd ..

if [ ! -d "$bin" ]; then
  mkdir bin
fi
platform=`uname`
case "${platform}" in
  Darwin)
    dd if=/dev/zero of=bin/bmfs.image bs=1m count=128
    ;;
  *)
    dd if=/dev/zero of=bin/bmfs.image bs=1M count=128
    ;;
esac

cd src/BMFS
autoreconf -fi
./configure
make
mv src/bmfs ../../bin/
cd ../..

./build.sh
./format.sh
./install.sh
