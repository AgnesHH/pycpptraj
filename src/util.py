import re
import sys
from glob import glob

def print_blank_line(num):
    for i in range(num):
        print

def find_class():
    src = "/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/AmberTools/src/cpptraj/src/"
    p = re.compile(r'#include "(.+?).h"')
    classlist = []
    
    for fname in glob(src + "*.h"):
        fnshort = fname.split("/")[-1]
        fh = open(fname, 'r')
        for line in fh.readlines():
            if line.startswith("class"):
                classname = line.split()[1].split(":")[0].split(";")[0]
                classlist.append(classname)
                #print "%s --> %s" % (fnshort, classname)
        fh.close()
    return list(set(classlist))


class Line_codegen:
    def __init__(self, myline):
        self.myline = myline 

    def shorten_string(self):
        if "std::string" in self.myline:
            self.myline = re.sub("std::string", "string", self.myline)

    def add_under_score_to_class(self, classlist):
        """classlist = list of cpptraj classes"""
        for classname in classlist:
            self.myline = re.sub(classname, "_" + classname, self.myline)

    def replace_others(self):
        self.myline = re.sub(r"{", "", self.myline)
        self.myline = re.sub(r";", "", self.myline)

    def swap_const(self):
        pass
