from glob import glob


lines = []
testlist = glob("test_*.py") + ['API_test.py', 'API_test_3.py',]
for pyfile in testlist:
    with open(pyfile, 'r') as fh:
        txt = fh.read()
        if "import unittest" in txt:
            lines.append("python ./%s \n") % pyfile

with open("./TestListTravis.sh", 'w') as fh:
    fh.writelines(lines)
