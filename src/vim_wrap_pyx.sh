#!/bin/sh

#wrap vim for openning two files

rootname=$1
cpptrajsrc="/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/AmberTools/src/cpptraj/src/"

if [ ! -f ${rootname}_py.pyx]; then
  cat PYX_template.dat > ${rootname}_py.pyx
fi

vim -O ${rootname}_py.pyx  $cpptrajsrc${rootname}.cpp
