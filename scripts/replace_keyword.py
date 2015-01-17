#!/usr/bin/env python
import sys
"""replace old key word by new key word in a file and save it to ./tmp/"""

oldfile, oldword, newword = sys.argv[1:]
with open(sys.argv[1], 'r') as fh:
    txt = fh.read()

if oldword in txt:
    txt = txt.replace(oldword, newword)
    
    with open("./tmp/" + oldfile, 'w') as fh2:
        fh2.write(txt)
else:
    print "no word to replace"
