# cython: boundscheck=False
# cython: wraparound=False
# cython: nonecheck=False
import numpy as np
cimport numpy as np
cimport cython

# Change these as desired.
data_type = np.uint64
ctypedef np.uint64_t data_type_t

cpdef test_memory_view(data_type_t [:] view):
    cdef Py_ssize_t i, j, n = view.shape[0]

    for j in range(0, n):
        for i in range(0, n):
            view[i] = view[j]

cpdef test_ndarray(np.ndarray[data_type_t, ndim=1] view):
    cdef Py_ssize_t i, j, n = view.shape[0]

    for j in range(0, n):
        for i in range(0, n):
            view[i] = view[j]

cpdef test_pointer(data_type_t [:] view):
    cdef Py_ssize_t i, j, n = view.shape[0]
    cdef data_type_t * data_ptr = &view[0]

    for j in range(0, n):
        for i in range(0, n):
            (data_ptr + i)[0] = (data_ptr + j)[0]

def run_test():
    import time
    from numpy import std, mean
    n = 10000
    repeats = 100
    a = np.arange(0, n,  dtype=data_type)
    funcs = [('1) memory view', test_memory_view),
        ('2) np.ndarray', test_ndarray),
        ('3) pointer', test_pointer)]

    results = {label: [] for label, func in funcs}
    for r in range(0, repeats):
        for label, func in funcs:
            start=time.time()
            func(a)
            results[label].append(time.time() - start)

    print('Results for `{}`'.format(data_type.__name__))
    for label, times in sorted(results.items()):
        print('{: <14}: {:.4f} +/- {:.4f}'.format(label, mean(times), std(times)))
