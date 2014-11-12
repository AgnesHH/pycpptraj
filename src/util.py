import string
import re
import sys
from glob import glob

def print_blank_line(num):
    for i in range(num):
        print

def find_class(src):
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

    def remove_std_namespace(self):
        self.myline = re.sub("std::", "", self.myline)

    def add_under_score_to_class(self, classlist):
        """classlist = list of cpptraj classes"""
        for classname in classlist:
            if classname in self.myline:
                if not re.search("_" + classname, self.myline):
                    self.myline = self.myline.replace(classname, r"_" + classname)

    def replace_others(self):
        if self.myline.startswith("~"):
            #dont need to use destructor here
            self.myline = "#" + self.myline
        #replace < > to []
        table = string.maketrans("<>", "[]")
        self.myline = self.myline.translate(table)
        self.myline = self.myline.replace(r"{", "")
        self.myline = self.myline.replace(r";", "")
        self.myline = self.myline.replace(r" ,", ",")
        self.myline = self.myline.replace(r" ( ", "(")
        self.myline = self.myline.replace(r" ) ", ")")
        #replace "bool" to "bint"
        self.myline = self.myline.replace("bool", "bint")

    def swap_const(self):
        p = re.compile("[a-zA-Z]* const &")
        words = re.findall(p, self.myline)
        for word in words:
            oldword = word.split()[0] + r" const &"
            newword = r"const " + word.split()[0] + r"&"
            self.myline = re.sub(oldword, newword, self.myline)
