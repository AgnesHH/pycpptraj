[![Build Status](https://travis-ci.org/hainm/pycpptraj.svg?branch=master)](https://travis-ci.org/hainm/pycpptraj)

Welcom to pycpptraj!
-------------------


Aim: Write cpptraj wrapper for Python user
-----------------------------------------
- Short term goal: expose cpptraj library to Python
- Very long term goal: glue most of useful library in [AMBER] (http://ambermd.org/) by Python: 
    * tleap --> pyleap
    * paramfit --> pyparamfit
    * reduce --> pyreduce 
    * ParmedTools
    * (add many more)
- Why using pycpptraj:
    * It's fast
        * it's a wrapper of cpptraj (was written in C++ (by Daniel R. Roe))
        * it has interface with numpy. Data calculation are performed without copying to numpy array
        * (but it actually does not need `numpy` at all, just optional)
    * It has clean syntax
        * Python/Cython style with fancy indexing 
    * It has been extensively testes
    * It's flexible: 
        * you can write extension modules in either high (Python) or low (C/C++ or Cython) level

Status: pre-release version 0.1
------------------------------

Citing (optional):
-----------------
- cpptraj : [PTRAJ and CPPTRAJ] (http://pubs.acs.org/doi/abs/10.1021/ct400341p): Software for Processing and Analysis of Molecular Dynamics Trajectory Data
Daniel R. Roe and Thomas E. Cheatham, III
Journal of Chemical Theory and Computation 2013 9 (7), 3084-3095 

- pycpptraj : Cite `cpptraj` paper and also:
    * H. Nguyen (year) pycpptraj (version XXX). Available at github.com/hainm/pycpptraj (Accessed date)

Install
-------
- install libcpptraj:
    ./installs/libcpptraj.txt 
- installs pycpptraj:
    ./installs/pycpptraj.txt

Usage: 
-----
- Make sure to export LD_LIBRARY_PATH before using
    + export LD_LIBRARY_PATH=$AMBERHOME/lib/:$LD_LIBRARY_PATH
    + or export LD_LIBRARY_PATH=$CPPTRAJHOME/lib:$LD_LIBRARY_PATH

- Check ./examples/

Version I am working on:
====================
* Ambertools 14
* Development version of `cpptraj` on github
* Python 2.7.8 :: Anaconda 2.1.0 (64-bit)
* Cython 0.21 and 0.22pre and development version of Cython
    * Development version: https://github.com/cython/cython
