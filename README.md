pycpptraj
=========

Aim: Write cpptraj wrapper for Python user
+ Short term goal: expose cpptraj library to Python
+ Long term goal: cpptraj + pycuda for GPU

cpptraj: 
PTRAJ and CPPTRAJ: Software for Processing and Analysis of Molecular Dynamics Trajectory Data
Daniel R. Roe and Thomas E. Cheatham, III
Journal of Chemical Theory and Computation 2013 9 (7), 3084-3095

1. Install
    Install libcpptrja.so and move to $AMBERHOME/lib/
   Compile Cython files: CFLAGS="-I$PYCPPTRAJHOME/src/ -I$AMBERHOME/AmberTools/src/cpptraj/src/" LDFLAGS="-I$AMBERHOME/lib/ -lgfortran -w" python ./setup.py build_ext -i  
       + example of setup.py: ./src/setup.py

2. Usage: 
+ PyCpptraj [cpptraj command line] 
+ Using cpptraj lib: (to be added)
