import numpy as np
from pycpptraj.Frame import Frame

frame = Frame(10)
frameref = Frame(10)

arr = np.random.rand(30)
print arr.__len__()
print arr
frame.SetFromCRD(arr, 30, 0, False)
print frame.Natom
print frame.size
print frame.Temperature

#for i in range(9):
#    frame.printAtomCoord(i)

# indexing
print
print "test indexing"
print frame[0]
print frame[1]
print frame[2]
print frame[3]

# frame.Info('frame info')
print "before swapping 1 - 8"
frame.printAtomCoord(1)
frame.printAtomCoord(8)
frame.SwapAtoms(1, 8)

print "after swapping 1 - 8"
frame.printAtomCoord(1)
frame.printAtomCoord(8)

print "deviding Frame"
frame.Divide(2.)
frame.printAtomCoord(1)
frame.printAtomCoord(8)


arrref = np.random.rand(30)
frameref.SetFromCRD(arr, 30, 0, False)

print "RMSD between frame and frameref = %s" % frame.RMSD(frameref)
