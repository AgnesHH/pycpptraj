class CythonDotParallel(object):
    """
    The cython.parallel module.
    """

    __all__ = ['parallel', 'prange', 'threadid']

    def parallel(self, num_threads=None):
        return nogil

    def prange(self, start=0, stop=None, step=1, schedule=None, nogil=False):
        if stop is None:
            stop = start
            start = 0
        return range(start, stop, step)

    def threadid(self):
        return 0

    # def threadsavailable(self):
        # return 1

