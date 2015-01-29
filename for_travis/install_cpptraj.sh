#!/bin/sh

set -ex
export PYCPPTRAJ_HOME=`pwd`
git clone https://github.com/mojyt/cpptraj
cd cpptraj
export CPPTRAJHOME=`pwd`
#export AMBERHOME=$CPPTRAJHOME
mkdir lib
#wget https://raw.githubusercontent.com/hainm/pycpptraj/master/for_travis/Makefile
#wget https://raw.githubusercontent.com/hainm/pycpptraj/master/for_travis/configure_pycpptraj
#mv Makefile* ./src/
# using configure_pycpptraj file in pycpptraj/installs
bash ../installs/configure_pycpptraj -nomathlib -shared gnu
cd ./src
# using Makefile file in pycpptraj/installs
make -f ../../installs/Makefile_libcpptraj libcpptraj

cd $PYCPPTRAJ_HOME
