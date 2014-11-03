from distutils.core import setup
from distutils.extension import Extension
import numpy as np
from Cython.Build import cythonize

setup(
      ext_modules = cythonize([
          Extension("*", ["*.pyx"],
                    libraries=['hello'],
                    include_dirs=[np.get_include()])
          ])
     )

