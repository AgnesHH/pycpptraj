# (c) 2014 - Hai Nguyen
import string
import re
import sys
from glob import glob
from collections import OrderedDict


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
        fh.close()
    return list(set(classlist))


class Line_codegen:

    # this is OrderedDict
    replace_dict = OrderedDict(
        (
        ("{", ""),
        (";", ""),
        (" ,", ","),
        (" ( ", "("),
        (" ) ", ")"),
        #(" ()", "()"),
        (" [ ]", "[]"),
        (" [", "["),
        (" &", "&"),
        (")const", ") const"),
        ("bool", "bint")))

    def __init__(self, myline):
        self.myline = myline

    def add_sharp(self):
        """add # to the begining of self.myline"""
        self.myline = "#" + self.myline

    def remove_std_namespace(self):
        self.myline = re.sub("std::", "", self.myline)

    def remove_unsupported(self):
        # delete static
        self.myline = self.myline.replace("static ", "")
        if self.myline.startswith("~"):
            # dont need to use destructor here
            self.add_sharp()

        if "const_iterator" in self.myline:
            self.add_sharp()
        if "operator =" in self.myline:
            self.add_sharp()

    def add_under_score_to_class(self, classlist):
        """classlist = list of cpptraj classes"""
        for classname in classlist:
            if classname in self.myline:
                if not re.search("_" + classname, self.myline):
                    self.myline = self.myline.replace(
                        classname, r"_" + classname)
    
    def replace(self, oldp, newp):
        self.myline = self.myline.replace(oldp, newp)


    def replace_others(self):
        """
        Add DOC here
        Need better function's name
        """

        # replace < > to []
        table = string.maketrans("<>", "[]")
        self.myline = self.myline.translate(table)
        for key, value in self.replace_dict.iteritems():
            self.myline = self.myline.replace(key, value)
        # self.myline = self.myline.replace(r"{", "")
        # self.myline = self.myline.replace(r";", "")
        # self.myline = self.myline.replace(r" ,", ",")
        # self.myline = self.myline.replace(r" ( ", "(")
        # self.myline = self.myline.replace(r" ) ", ")")
        # replace "bool" to "bint"
        # self.myline = self.myline.replace("bool", "bint")

    def replace_waka(self):
        """change <> to []"""
        table = string.maketrans("<>", "[]")
        self.myline = self.myline.translate(table)

    def swap_const(self):
        """add DOC here"""
        p = re.compile("[a-zA-Z0-9_]* const &")
        words = re.findall(p, self.myline)
        for word in words:
            oldword = word.split()[0] + r" const &"
            newword = r"const " + word.split()[0] + r"&"
            self.myline = re.sub(oldword, newword, self.myline)

        # change: "vector[int] const&" to "const vector[int]&"
        # find type in [ ] 
        p = re.compile("vector\[(\w+)\] const&")
        words = re.findall(p, self.myline)
        for word in words:
            oldp = "vector[%s] const&" % word
            newp = "const vector[%s]&" % word
            self.myline = self.myline.replace(oldp, newp)
    
    def remove_word(self):
        wlist = [" const", " inline", "const", "inline", "&" ]
        for word in wlist:
            self.myline = self.myline.replace(word, "")

    def remove_preassignment(self):
        """
        there will be error if having something like this
        _DihedralParmType() : pk_(0 ), pn_(0 ), phase_(0 ), scee_(0 ), scnb_(0)
        Or 
        _DihedralParmType(): pk_(0 ), pn_(0 ), phase_(0 ), scee_(0 ), scnb_(0)

        Aim: remove ": pk_(0 ), pn_(0 ), phase_(0 ), scee_(0 ), scnb_(0)"
        """
        if "() :" in self.myline or "):" in self.myline:
            self.myline = self.myline.split(":", 1)[0]

    def insert_self_word(self):
        """Insert "self" to function"""
        # split first "()"
        begin, end = self.myline.split("(", 1)
        self.myline = begin + "(self," + end + ":"
        if "(self,)" in self.myline:
            self.myline = self.myline.replace("(self,)", "(self)")
        # replace ") :" to "):"
        self.myline = self.myline.replace(") :", "):")

    def has_ignored_words(self):
        wlist = ["#",]

        for word in wlist:
            if word in self.myline:
                return True
        return False