#!/bin/sh

rsync --archive --update --delete --verbose --progress --exclude "Lauferbackup" -e 'ssh -p 2817'  /mnt/raidc2/Study/Cython/wrap_cpptraj_1 haichit@biocomp.laufercenter.stonybrook.edu:/home/haichit/PyCpptraj_backup/
