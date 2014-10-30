import numpy
cimport numpy
cimport cython
import print_time 

@cython.boundscheck(False)
@cython.wraparound(False)
def primes(int kmax):
    cdef int n, k, i
    cdef int[:] p = numpy.empty(kmax, dtype=numpy.int32)
    k = 0
    n = 2
    while k < kmax:
        i = 0
        while i < k and n % p[i] != 0:
            i = i + 1
        if i == k:
            p[k] = n
            k = k + 1
        n = n + 1
    return p

print print_time.print_time(primes, 1000)
