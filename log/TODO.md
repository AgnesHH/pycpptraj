TODO
----

* Sometimes get every large ts[-1:-9:-1][0].n_atoms (example: 30401312 atoms vs Tc5b = 304 atoms)
    (ts is FrameArray or Trajin_Single instance)
* Add exception
* Rename "./examples" folder to "tests" and make REAL example script
* make action, analysis dictionary
* write script to mine the enum in cpptraj code and convert to dict : DONE
* Write automated script to convert *.h (cpptraj) to *.pxd (pycpptraj) files : DONE
* rename modules to lower case
* adding more doc
* to know why getting "ImportError: No module named trajs.TrajectoryIO" in `travis-ci`: DONE
    * wrong setup.py (this one did not inlcude pycpptraj.trajs as a package)
* Remove unused *pxd and *pyx files 
