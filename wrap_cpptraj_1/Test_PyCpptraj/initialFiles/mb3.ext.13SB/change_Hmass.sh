#!/bin/sh

toproot=$1 #1FME.ff99SB_JSC.mb3

cat > parm.in <<EOF
HMassRepartition
outparm $toproot.newHmass.dt4fs.top
EOF

python ~/AMBER14_GTX680/bin/parmed.py $toproot.top parm.in
