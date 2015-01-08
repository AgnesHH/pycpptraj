def for_testing(funct):
    def inner(*args, **kwd):
        print "this %s method is for tesing purpose" % funct.__name__ 
        return funct(*args, **kwd)
    return inner

def iter_warning(funct):
    def inner(*args, **kwd):
        if args[0].size <= 0:
            raise ValueError("empty object, cannot do iteration")
        return funct(*args, **kwd)
    return inner
