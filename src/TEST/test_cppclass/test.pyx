# distutils: language = c++

cdef cppclass Foo:
    Foo()
    Foo(int x)
    int operator/(int)

