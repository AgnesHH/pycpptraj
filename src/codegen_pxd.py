import CppHeaderParser
from util import print_blank_line, Line_codegen
from util import find_class
import sys

cpptrajsrc="/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/AmberTools/src/cpptraj/src/"
file=cpptrajsrc + sys.argv[1]
indent = " "*4
classlist = find_class(cpptrajsrc)

cpp = CppHeaderParser.CppHeader(file)

print "# distutils: language = c++"
for finclude in cpp.includes:
    #remove "#"
    if finclude.startswith('"'):
        finclude = finclude.split('"')[1]
    if not finclude.startswith("<"):
        print "from %s cimport *" % (finclude.split(".")[0])

print_blank_line(2)
print 'cdef extern from "%s": ' % file.split("/")[-1]

#make assumption that there's only one class in header file
classname = cpp.classes.keys()[0]
extcl = "_" + classname

print '%scdef cpplass %s "%s":' % (indent, extcl, classname)

#method section
methods = cpp.classes[classname]['methods']['public']

for method in methods:
    #rtype = method['rtnType']
    #func = method['name']
    #print '%s%s %s' %(indent*2, rtype, func)
    #create an instance of LineCodegen (inherited from list)
    line = Line_codegen(method['debug'])
    if not 'virtual' in line.myline:
        line.remove_std_namespace()
        line.swap_const()
        line.add_under_score_to_class(classlist)
        line.replace_others()
        print indent*2 + line.myline

