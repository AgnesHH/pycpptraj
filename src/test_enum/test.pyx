ctypedef enum options: OPT1, OPT2, OPT3

def main():
    cdef options test
    test = OPT2
    f(test)

cdef void f(options inp):
    if inp==OPT1:
        print 'OPT1'
    elif inp==OPT2:
        print 'OPT2'
    elif inp==OPT3:
        print 'OPT3'
