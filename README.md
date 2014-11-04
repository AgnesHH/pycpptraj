Welcom to pycpptraj!
====================

Aim: Write cpptraj wrapper for Python user
=========================================
- Short term goal: expose cpptraj library to Python
- Long term goal: cpptraj + pycuda for GPU
- Very very long term goal: glue most of useful library in AMBER by Python: 
    * tleap --> pyleap
    * paramfit --> pyparamfit
    * reduce --> pyreduce 
    * ParmedTools
    * (add many more)

Status: 
======
`pycpptraj` is not ready to use but you can explore its codes in ./src/ folder.

cpptraj paper: 
==============
PTRAJ and CPPTRAJ: Software for Processing and Analysis of Molecular Dynamics Trajectory Data
Daniel R. Roe and Thomas E. Cheatham, III
Journal of Chemical Theory and Computation 2013 9 (7), 3084-3095
http://pubs.acs.org/doi/abs/10.1021/ct400341p

Install
=======
- Install `libcpptraj.so` and move to $AMBERHOME/lib/
- Compile Cython files: CFLAGS="-I$PYCPPTRAJHOME/src/ -I$AMBERHOME/AmberTools/src/cpptraj/src/" LDFLAGS="-I$AMBERHOME/lib/ -lgfortran -w" python ./setup.py build_ext -i  
       * example of setup.py: ./src/setup.py
       * shared library ./src/src/*.so

Usage: 
=====
- Make sure to export LD_LIBRARY_PATH before using
    + export LD_LIBRARY_PATH="$AMBERHOME/lib/"
- ./src/PyCpptraj [cpptraj command line] 
- Using cpptraj lib: (to be added)
       * ./Examples/

Version:
=======
* Ambertools 14
* Python 2.7.8 :: Anaconda 2.1.0 (64-bit)
* Cython 0.21
* numpy 1.9.0

May need
*  Nose: for testing
*  Matplotlib: for plotting
