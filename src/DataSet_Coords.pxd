inden = ' '*4
print "# distutil: language = c++"

print "cdef extern from filename.h:"
#parse "class"
print indent + "cdef cppclass %s %s" % (classname, classname2)

#process block between public and protected or private
#parse class keywords and change from classname to _classname
#if exist "~": skip
#if exist const&: swap(line[i], line[i+1]) where i+1 is index of const
#format: type functionname(arglist)
#    find_func_name: right before 1st "("
print indent*2 + type + funcname + process_arglist()

def process_arglis(argline):
    args = argline.split(',')
    for i, arg in enumerate(args):
        #search class' name
    
