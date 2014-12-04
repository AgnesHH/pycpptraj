from pycpptraj.NameType import NameType
# TODO: write testing 

# test create instance
nt1 = NameType("test11111")
nt2 = NameType("test11111")
nt3 = NameType(nt1)

print "test Match"
print nt1.Match(nt2)
print nt2.Match(nt3)
print

print "test != operator"
print nt1 != nt2
print nt1 != nt3

nt4 = NameType("t")
print nt1 != nt4
print nt1.Match(nt4)
print

# test indexing
print "test indexing"
print nt1[3]

print "test == operator"
print nt4 == "t"
print nt1 == 'test1'
print

# 
print "test Truncated"
nt1.Truncated()
print nt1 == nt4
print "test ToBuffer"
# s = ''
# nt1.ToBuffer(s)
# print s
