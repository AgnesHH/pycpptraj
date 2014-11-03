#!/bin/sh

top=Tc5b.ff99SB_JSC.mb3.newHmass.dt4fs.top
refnat=Tc5b.nat.crd

PyCpptraj $top <<EOF
trajin md1_prod.x 1 last 
reference $refnat
rms reference out rmsd_CA_to_nat_res3_18.dat :3-18@CA
EOF
