from ArgList import ArgList as AL

c1 = AL()
c2 = AL("trajout trajout.x @CA, C, N")
c3 = AL("test1")
c4 = AL(c2)

for sinput in c2:
    print sinput

print "----------------------"
print c2.ArgLine()
