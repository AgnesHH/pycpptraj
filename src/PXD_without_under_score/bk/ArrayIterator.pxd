# distutils: language = c++


cdef extern from "ArrayIterator.h": 
    cdef cppclass ArrayIterator "ArrayIterator":
        ArrayIterator() : ptr_(0)
        ArrayIterator(const ArrayIterator& rhs): ptr_(rhs ptr_)
        ArrayIterator(T * pin): ptr_(pin)
        #ArrayIterator& operator =(const ArrayIterator& rhs)
        #bint operator = =(const ArrayIterator& rhs) const 
        bint operator ! =(const ArrayIterator& rhs) const 
        ArrayIterator& operator + +() 
        ArrayIterator operator + +(int)
        T& operator *() 
        T * operator -]() 
        ArrayIterator& operator + =(int offset)
        ArrayIterator operator +(int offset)
