#!/bin/sh

set -ex
git clone https://github.com/mojyt/cpptraj
cd cpptraj
export CPPTRAJHOME=`pwd`
mkdir lib
wget https://raw.githubusercontent.com/hainm/pycpptraj/master/for_travis/Makefile
wget https://raw.githubusercontent.com/hainm/pycpptraj/master/for_travis/configure_pycpptraj
mv Makefile ./src/
./configure_pycpptraj -nobzlib  -nonetcdf -nobzlib  -nomathlib -nozlib -shared gnu
cd ./src
make libcpptraj.so
