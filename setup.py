import os
import sys
from distutils.core import setup
from distutils.extension import Extension
from random import shuffle


# import/install Cython
try:
    import Cython.Distutils.build_ext
    from Cython.Build import cythonize
except:
    print "There is no Cython"
    print "try: pip install --upgrade git+git://github.com/cython/cython@master"
    try_cython = raw_input("install Cython? y/n ")

    if try_cython.upper() in ['Y', 'YES']:
        os.system("pip install --upgrade git+git://github.com/cython/cython@master")
    else:
        sys.exit("I can't install pycpptraj without cython")

# this setup.py file was adapted from setup.py file in Cython package
def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

class PathError(Exception):
    def __init__(self, msg):
        pass

rootname = os.getcwd()
pycpptraj_home = rootname + "/pycpptraj/"

# find/install libcpptraj
try:
        cpptraj_dir = os.environ['CPPTRAJHOME'] 
        cpptraj_include = cpptraj_dir + "/src/"
        libdir = cpptraj_dir + "/lib/"
except:
    cpptraj_dir = rootname + "/cpptraj/"
    cpptraj_include = cpptraj_dir + "/src/"
    libdir = cpptraj_dir + "/lib"

if not os.path.exists(cpptraj_dir):
    print "cpptraj_dir does not exist"
    cpptraj_dir = raw_input("Please specify your cpptraj_dir: \n")
    cpptraj_include = cpptraj_dir + "/src/"
    libdir = cpptraj_dir + "/lib/"
    #raise PathError("cpptraj_dir does not exist")

# get *.pyx files
pyxfiles = []
with open("PYXLIST.txt", 'r') as f:
    for line in f.readlines():
        if "#" not in line:
            pyxfiles.append(line.split("\n")[0])

#" use shuffle so we can use "python ./setup.py build" several times
# to make the compiling faster (really?)
shuffle(pyxfiles)

USE_PYX = True
if not USE_PYX:
    ext = ".cpp"
else:
    ext = ".pyx"

ext_modules = []
for ext_name in pyxfiles:
    pyxfile = pycpptraj_home + ext_name + ext

    # replace "/" by "." get module
    if "/" in ext_name:
        ext_name = ext_name.replace("/", ".")

    extmod = Extension("pycpptraj." + ext_name,
                    sources=[pyxfile],
                    libraries=['cpptraj'],
                    language='c++',
                    library_dirs=[libdir,],
                    include_dirs=[cpptraj_include, pycpptraj_home])
    ext_modules.append(extmod)

pxd_include_dirs = [
        directory for directory, dirs, files in os.walk('pycpptraj')
        if '__init__.pyx' in files or '__init__.pxd' in files
        or '__init__.py' in files
        ]

pxd_include_patterns = [
        p+'/*.pxd' for p in pxd_include_dirs ] + [
        p+'/*.pyx' for p in pxd_include_dirs ]
         

setup_args = {}
# TODO : automatically discover packages
packages = [
        'pycpptraj',
        'pycpptraj.utils',
        'pycpptraj.actions',
        'pycpptraj.analyses',
        'pycpptraj.datasets',
        'pycpptraj.parms',
        'pycpptraj.clusters',
        'pycpptraj.trajs',
        'pycpptraj.gdt',
        'pycpptraj.data_sample',
        ]

datalist = [[p[10:] for p in pxd_include_patterns] + ['data_sample/*/*', 'data_sample/*']]
setup_args['package_data'] = {
        'pycpptraj' : datalist[0], 
        }

if __name__ == "__main__":
    setup(
        name="PyCpptraj",
        version="0.1.beta",
        author="Hai Nguyen",
        author_email="hainm.comp@gmail.com",
        url="https://github.com/hainm/pycpptraj",
        packages=packages,
        description="""Python wrapper for cpptraj""",
        long_description=read("README.md"),
        license = "BSD License",
        classifiers=[
                    'Development Status :: Beta',
                    'Operating System :: Linux',
                    'Intended Audience :: Science/Research',
                    'License :: BSD License',
                    'Programming Language :: Python',
                    'Programming Language :: Cython',
                    'Programming Language :: C',
                    'Programming Language :: C++',
                    'Topic :: Scientific/Engineering'],
        ext_modules = ext_modules,
        #ext_modules = cythonize(ext_modules, gdb_debug=True),
        cmdclass = {'build_ext': Cython.Distutils.build_ext},
        **setup_args
    )
