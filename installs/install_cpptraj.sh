#!/bin/sh

# PYCPPTRAJ_HOME is the root folder of `pycpptraj`

cd $CPPTRAJHOME
mkdir lib
bash $PYCPPTRAJ_HOME/configure_pycpptraj -nomathlib -shared gnu
cd $CPPTRAJHOME/src
make -f $PYCPPTRAJ_HOME/Makefile_libcpptraj libcpptraj.so
cd $PYCPPTRAJ_HOME
