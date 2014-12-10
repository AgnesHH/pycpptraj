import os
#import shutil
#from glob import glob
from distutils.core import setup
from distutils.extension import Extension
import Cython.Distutils.build_ext
from Cython.Build import cythonize

def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

rootname = os.getcwd()
pycpptraj_home = rootname + "/pycpptraj/"
action_dir = pycpptraj_home + "/Action/"
ana_dir = pycpptraj_home + "/Analysis/"

try:
    cpptraj_dir = cpptraj_include = os.environ['AMBERHOME'] + "/AmberTools/src/cpptraj/src/"
    libdir = os.environ['AMBERHOME'] + "/lib"
except:
    raise EnvironmentError("Must set AMBERHOME")

# get *.pyx files
pyxfiles = []
with open("PYXLIST.txt", 'r') as f:
    for line in f.readlines():
        if "#" not in line:
            pyxfiles.append(line.split("\n")[0])

USE_CYTHON = True
if USE_CYTHON == False:
    ext = ".cpp"
else:
    ext = ".pyx"

ext_modules = []
for ext_name in pyxfiles:
    if "/" in ext_name:
        ext_name = ext_name.replace("/", ".")
    pyxfile = pycpptraj_home + ext_name + ext
    extmod = Extension("pycpptraj." + ext_name,
                    [pyxfile],
                    libraries=['cpptraj'],
                    language='c++',
                    library_dirs=[libdir,],
                    include_dirs=[cpptraj_include, pycpptraj_home, action_dir, ana_dir])
    ext_modules.append(extmod)

setup(
    name="PyCpptraj",
    version="0.1",
    author="Hai Nguyen",
    author_email="hainm.comp@gmail.com",
    url="https://github.com/hainm/pycpptraj",
    packages=['pycpptraj',],
    #package_data={"pycpptraj": ["__init__.py", "*.pyx", "*.pxd", "./Action/*", "Analysis/*"]},
    description="""Python wrapper for cpptraj""",
    long_description=read("README.md"),
    license = "BSD License",
    platform = "I don't know yet",
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
    cmdclass = {'build_ext': Cython.Distutils.build_ext},
)
