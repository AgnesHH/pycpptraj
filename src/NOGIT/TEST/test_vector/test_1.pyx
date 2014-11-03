# distutils: language = c++
#for Haichit: this code works.

from libcpp.vector cimport vector
from cython.operator cimport dereference as deref, preincrement as inc

cdef vector[int] v
cdef vector[int].iterator viter 
cdef int it

v.push_back(1)
v.push_back(2)
v.push_back(5)

for it in v:
    print it

print(v)

viter = v.begin()
while viter != v.end():
    print deref(viter)
    inc(viter)
