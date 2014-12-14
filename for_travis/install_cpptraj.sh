#!/bin/sh

set -ex
export PYCPPTRAJ_HOME=`pwd`
git clone https://github.com/mojyt/cpptraj
cd cpptraj
export CPPTRAJHOME=`pwd`
#export AMBERHOME=$CPPTRAJHOME
mkdir lib
wget https://raw.githubusercontent.com/hainm/pycpptraj/master/for_travis/Makefile
wget https://raw.githubusercontent.com/hainm/pycpptraj/master/for_travis/configure_pycpptraj
mv Makefile* ./src/
bash ./configure_pycpptraj -nobzlib  -nomathlib -nozlib -shared gnu
cd ./src
make -f Makefile.1 libcpptraj.so

cd $PYCPPTRAJ_HOME
