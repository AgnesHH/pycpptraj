#TODO: should re-write, looks ugly
import CppHeaderParser
from util import print_blank_line, Line_codegen
from util import find_class
import sys

cpptrajsrc="/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/AmberTools/src/cpptraj/src/"
file=cpptrajsrc + sys.argv[1]
indent = " "*4
classlist = find_class(cpptrajsrc)
cpp = CppHeaderParser.CppHeader(file)


#make assumption that there's only one class in header file
classname = cpp.classes.keys()[0]

if cpp.classes[classname]['enums']['public']:
    for enumlist in cpp.classes[classname]['enums']['public']:
        print indent + "# %s" % sys.argv[1]
        enumname = enumlist['name']
        enumext = classname + "::" + enumname
        print indent + 'ctypedef enum %s "%s":' % (enumname, enumext)
        for enumvar in enumlist['values']:
            enumvarname = enumvar['name']
            enumvarnameext =  classname + "::" + enumvarname
            print indent*2 + '%s "%s"' % (enumvarname, enumvarnameext)
