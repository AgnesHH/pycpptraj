import os
from distutils import ccompiler

compiler = ccompiler.new_compiler()
try:
    libcpptraj_dir = os.environ['CPPTRAJHOME'] + "/lib/"
except:
    try:
        libcpptraj_dir = os.environ['AMBERHOME'] + "/lib/"
    except:
        raise EnvironmentError("must set CPPTRAJHOME or AMBERHOME")

lib_dirs=['/usr/lib','/usr/local/lib',os.path.expanduser('~/lib')]
lib_dirs.append(libcpptraj_dir)

print compiler.find_library_file(lib_dirs, 'cpptraj')
