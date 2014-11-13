#!/bin/sh

#wrap vim for openning two files

rootname=$1
cpptrajsrc="/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/AmberTools/src/cpptraj/src/"

if [ ! -f ${rootname}.pyx ]; then
  cat PYX_template.dat > ${rootname}.pyx
fi

vim -O ${rootname}.pyx  $cpptrajsrc${rootname}.cpp
