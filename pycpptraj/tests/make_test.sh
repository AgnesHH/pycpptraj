#!/bin/sh

rootname=$1

cat test_template.pyx_ | sed "s/template/$rootname/g" > test_$rootname.pyx
