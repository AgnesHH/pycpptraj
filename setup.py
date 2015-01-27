import os
from distutils.core import setup
from distutils.extension import Extension
import Cython.Distutils.build_ext
from Cython.Build import cythonize
from random import shuffle

# this setup.py file was adapted from setup.py file in Cython package
def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

rootname = os.getcwd()
pycpptraj_home = rootname + "/pycpptraj/"

try:
        cpptraj_dir = os.environ['CPPTRAJHOME'] 
        cpptraj_include = cpptraj_dir + "/src/"
        libdir = os.environ['CPPTRAJHOME'] + "/lib/"
except:
    cpptraj_dir = rootname + "/cpptraj/"
    cpptraj_include = cpptraj_dir + "/src/"
    libdir = cpptraj_dir + "/lib"

# get *.pyx files
pyxfiles = []
with open("PYXLIST.txt", 'r') as f:
    for line in f.readlines():
        if "#" not in line:
            pyxfiles.append(line.split("\n")[0])

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
                    [pyxfile],
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
        version="0.1",
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
