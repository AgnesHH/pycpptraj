Welcom to pycpptraj!
====================

Aim: Write cpptraj wrapper for Python user
=========================================
- Short term goal: expose cpptraj library to Python
- Long term goal: cpptraj + pycuda for GPU
- Very very long term goal: glue most of useful library in [AMBER] (http://ambermd.org/) by Python: 
    * tleap --> pyleap
    * paramfit --> pyparamfit
    * reduce --> pyreduce 
    * ParmedTools
    * (add many more)

Status: 
======
`pycpptraj` is not ready to use but you can explore its codes in ./src/ folder.
Code examples:
* ./src/Matrix_3x3.pyx
* ./src/main_cpptraj_py.pyx
* ./examples/*.py

cpptraj paper: 
==============
[PTRAJ and CPPTRAJ] (http://pubs.acs.org/doi/abs/10.1021/ct400341p): Software for Processing and Analysis of Molecular Dynamics Trajectory Data
Daniel R. Roe and Thomas E. Cheatham, III
Journal of Chemical Theory and Computation 2013 9 (7), 3084-3095 

Install
=======
- Install `libcpptraj.so` and move to $AMBERHOME/lib/
    * Read: INSTALL_libcpptraj.txt
- python ./setup.py install
       * Install idividual module
           * cd ./src
           * ./Install_single_file.sh Box.pyx
           * python ../examples/test_Box.py

Usage: 
=====
- Make sure to export LD_LIBRARY_PATH before using
    + export LD_LIBRARY_PATH="$AMBERHOME/lib/"
- Check ./examples/

Version I am working:
=======
* Ambertools 14
* Python 2.7.8 :: Anaconda 2.1.0 (64-bit)
* Cython 0.21 and 0.22pre
* CppHeaderParser 2.4.3 (for parsing cpptraj header files)

Hacking
=======
Most of pxd files, test cases (and *pyx files too?) were generated by scripts I wrote in ./scripts_for_wrapping/
(It's better to use those scripts when Dan Roe updates/changes his cpptraj code)
