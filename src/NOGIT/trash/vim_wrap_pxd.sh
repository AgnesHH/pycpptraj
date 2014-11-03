#!/bin/sh

#wrapp vim for openning two files

pxd=$1
cpptrajsrc="/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/AmberTools/src/cpptraj/src/"

vim -O ${pxd}.pxd  $cpptrajsrc${pxd}.h
