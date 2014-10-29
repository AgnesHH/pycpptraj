# cython: language_level=3
# cython: boundscheck=False
# cython: wraparound=False

import time
import sys

from cpython.array cimport array, clone
from cython.view cimport array as cvarray
from libc.stdlib cimport malloc, free
import numpy as numpy
cimport numpy as numpy

cdef int loops

def timefunc(name):
    def timedecorator(f):
        cdef int L, i

        print("Running", name)
        for L in [1, 10, 100, 1000, 10000, 100000, 1000000]:
            start = time.clock()
            f(L)
            end = time.clock()
            print(format((end-start) / loops * 1e6, "2f"), end=" ")
            sys.stdout.flush()

        print("µs")
    return timedecorator

print()
print("INITIALISATIONS")
loops = 100000

@timefunc("cpython.array buffer")
def _(int L):
    cdef int i
    cdef array[double] arr, template = array('d')

    for i in range(loops):
        arr = clone(template, L, False)

    # Prevents dead code elimination
    str(arr[0])

@timefunc("cpython.array memoryview")
def _(int L):
    cdef int i
    cdef double[::1] arr
    cdef array template = array('d')

    for i in range(loops):
        arr = clone(template, L, False)

    # Prevents dead code elimination
    str(arr[0])

#@timefunc("cpython.array raw C type")
#def _(int L):
#    cdef int i
#    cdef array arr, template = array('d')
#
#    for i in range(loops):
#        arr = clone(template, L, False)
#
#    # Prevents dead code elimination
#    str(arr[0])

@timefunc("numpy.empty_like memoryview")
def _(int L):
    cdef int i
    cdef double[::1] arr
    template = numpy.empty((L,), dtype='double')

    for i in range(loops):
        arr = numpy.empty_like(template)

    # Prevents dead code elimination
    str(arr[0])

@timefunc("malloc")
def _(int L):
    cdef int i
    cdef double* arrptr

    for i in range(loops):
        arrptr = <double*> malloc(sizeof(double) * L)
        free(arrptr)

    # Prevents dead code elimination
    str(arrptr[0])

@timefunc("malloc memoryview")
def _(int L):
    cdef int i
    cdef double* arrptr
    cdef double[::1] arr

    for i in range(loops):
        arrptr = <double*> malloc(sizeof(double) * L)
        arr = <double[:L]>arrptr
        free(arrptr)

    # Prevents dead code elimination
    str(arr[0])

@timefunc("cvarray memoryview")
def _(int L):
    cdef int i
    cdef double[::1] arr

    for i in range(loops):
        arr = cvarray((L,),sizeof(double),'d')

    # Prevents dead code elimination
    str(arr[0])



print()
print("ITERATING")
loops = 1000

@timefunc("cpython.array buffer")
def _(int L):
    cdef int i
    cdef array[double] arr = clone(array('d'), L, False)

    cdef double d
    for i in range(loops):
        for i in range(L):
            d = arr[i]

    # Prevents dead-code elimination
    str(d)

@timefunc("cpython.array memoryview")
def _(int L):
    cdef int i
    cdef double[::1] arr = clone(array('d'), L, False)

    cdef double d
    for i in range(loops):
        for i in range(L):
            d = arr[i]

    # Prevents dead-code elimination
    str(d)

@timefunc("cpython.array raw C type")
def _(int L):
    cdef int i
    cdef array arr = clone(array('d'), L, False)

    cdef double d
    for i in range(loops):
        for i in range(L):
            d = arr[i]

    # Prevents dead-code elimination
    str(d)

@timefunc("numpy.empty_like memoryview")
def _(int L):
    cdef int i
    cdef double[::1] arr = numpy.empty((L,), dtype='double')

    cdef double d
    for i in range(loops):
        for i in range(L):
            d = arr[i]

    # Prevents dead-code elimination
    str(d)

@timefunc("malloc")
def _(int L):
    cdef int i
    cdef double* arrptr = <double*> malloc(sizeof(double) * L)

    cdef double d
    for i in range(loops):
        for i in range(L):
            d = arrptr[i]

    free(arrptr)

    # Prevents dead-code elimination
    str(d)

@timefunc("malloc memoryview")
def _(int L):
    cdef int i
    cdef double* arrptr = <double*> malloc(sizeof(double) * L)
    cdef double[::1] arr = <double[:L]>arrptr

    cdef double d
    for i in range(loops):
        for i in range(L):
            d = arr[i]

    free(arrptr)

    # Prevents dead-code elimination
    str(d)

@timefunc("cvarray memoryview")
def _(int L):
    cdef int i
    cdef double[::1] arr = cvarray((L,),sizeof(double),'d')

    cdef double d
    for i in range(loops):
        for i in range(L):
            d = arr[i]

    # Prevents dead-code elimination
    str(d)
