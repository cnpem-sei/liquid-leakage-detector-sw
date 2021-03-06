#!/usr/bin/env sh
gcc -mfloat-abi=hard -Wall -fPIC -O2 -mtune=cortex-a8 -march=armv7-a -I/usr/include -c -o Reflexao.o Reflexao.c
ar -rv libReflexao.a Reflexao.o
gcc -shared -Wl,-soname, -o libReflexao.so Reflexao.o
pasm -V3 -b Reflexao0.p
pasm -V3 -b Reflexao1.p


install -m0755 libReflexao.a libReflexao.so /usr/lib
ldconfig -n /usr/lib/libReflexao.*
install -m0755 Reflexao.h /usr/include

mv Reflexao0.bin /usr/bin
mv Reflexao1.bin /usr/bin

rm Reflexao.o libReflexao.so libReflexao.a 
