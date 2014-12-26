import numpy as np
from pycpptraj.Frame import Frame

frame = Frame(10)
frameref = Frame(10)

arr = np.random.rand(30)
print arr.__len__()
print arr
frame.set_from_crd(arr, 30, 0, False)
print frame.n_atoms
print frame.size
print frame.temperature

print frame.xyz(0)
#print frame.xyz

#for i in range(9):
#    frame.print_atom_coord(i)

# indexing
print
print "test indexing"
print frame[0]
print frame[1]
print frame[2]
print frame[3]
i = 0
print "xyz[0]: ", frame.xyz(0)
print "xyz[1]: ", frame.xyz(1)
print frame.size
for i in range(frame.size/3):
    print frame.xyz(i)

# frame.info('frame info')
print "before swapping 1 - 8"
frame.print_atom_coord(1)
frame.print_atom_coord(8)
frame.swap_atoms(1, 8)

print "after swapping 1 - 8"
frame.print_atom_coord(1)
frame.print_atom_coord(8)

print "deviding Frame"
frame.divide(2.)
frame.print_atom_coord(1)
frame.print_atom_coord(8)


arrref = np.random.rand(30)
frameref.set_from_crd(arr, 30, 0, False)

#print "RMSD between frame and frameref = %s" % frame.rmsd(frameref)
