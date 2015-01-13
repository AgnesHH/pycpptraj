#!/bin/sh

cat ./pycpptraj/*.p* ./examples/*.py | sed '/^\s*$/d' | wc -l 
