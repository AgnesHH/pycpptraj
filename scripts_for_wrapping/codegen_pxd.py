# (c) 2014 Hai Nguyen
# TODO: should re-write, looks ugly
import os
import CppHeaderParser
from util import print_blank_line, Line_codegen
from util import find_class
import sys

#cpptrajsrc = os.environ['AMBERHOME'] + "AmberTools/src/cpptraj/src/"
cpptrajsrc = os.environ['CPPTRAJHOME'] + "/src/"
filename = cpptrajsrc + sys.argv[1]
indent = " " * 4
classlist = find_class(cpptrajsrc)
cpp = CppHeaderParser.CppHeader(filename)

# print header line "c++" so Cython know it is c++ code
# (adding to setup.py seems not work)
print "# distutils: language = c++"

#add vector, string if having ones
stdlist = ['vector', 'string']
with open(filename, 'r') as fh:
    linelist = " ".join(fh.readlines())
    for word in stdlist:
        if word in linelist:
            print "from libcpp.%s cimport %s" % (word, word)

for finclude in cpp.includes:
    # remove "
    if finclude.startswith('"'):
        finclude = finclude.split('"')[1]
    # import stuff (in cpptraj header files, need to add libcpp.* too)
    if not finclude.startswith("<"):
        print "from %s cimport *" % (finclude.split(".")[0])

print_blank_line(2)
print 'cdef extern from "%s": ' % filename.split("/")[-1]

# make assumption that there's only one class in header file
for classname in cpp.classes.keys():
    #create enum
    if cpp.classes[classname]['enums']['public']:
        for enumlist in cpp.classes[classname]['enums']['public']:
            print indent + "# %s" % sys.argv[1]
            enumname = enumlist['name']
            enumext = classname + "::" + enumname
            print indent + 'ctypedef enum %s "%s":' % (enumname, enumext)
            for enumvar in enumlist['values']:
                enumvarname = enumvar['name']
                enumvarnameext = classname + "::" + enumvarname
                print indent * 2 + '%s "%s"' % (enumvarname, enumvarnameext)
    
    # declare cpp class
    extcl = "_" + classname
    print '%scdef cppclass %s "%s":' % (indent, extcl, classname)
    methods = cpp.classes[classname]['methods']['public']
    for method in methods:
        line = Line_codegen(method['debug'])
        # move to line's methods?
        if 'virtual' in line.myline:
            line.add_sharp()
        line.remove_std_namespace()
        line.swap_const()
        line.add_under_score_to_class(classlist)
        line.replace_others()
        line.swap_const()
        line.remove_unsupported()
        line.remove_preassignment()
        print indent * 2 + line.myline
    print_blank_line(2)

for classname in cpp.classes.keys():
    print "cdef class %s:" %classname
    print "%scdef _%s* thisptr" %(indent, classname)
    print 
