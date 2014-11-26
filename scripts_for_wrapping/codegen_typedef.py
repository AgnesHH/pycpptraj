from util import Line_codegen
import sys

fname = sys.argv[1]

with open(fname, 'r') as fh:
    lines = fh.readlines()
    for line in lines:
        linegen = Line_codegen(line)
        linegen.remove_std_namespace()
        linegen.replace(";", "")
        linegen.replace("typedef", "ctypedef")
        linegen.replace_waka()
        print linegen.myline

