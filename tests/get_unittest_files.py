from glob import glob

for pyfile in glob("test_*.py"):
    with open(pyfile, 'r') as fh:
        txt = fh.read()
        if "import unittest" in txt:
            print "python ./%s" % pyfile
