#!/bin/sh

#grep word in cpptraj folder

cpptrajsrc="/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/AmberTools/src/cpptraj/src/"
grep $1 $cpptrajsrc$2
