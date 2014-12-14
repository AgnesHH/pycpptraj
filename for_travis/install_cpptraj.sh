#!/bin/sh

set -ex
git clone https://github.com/mojyt/cpptraj
cd cpptraj
export CPPTRAJHOME=`pwd`
mkidr lib

