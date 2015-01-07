def for_testing(funct):
    def inner(*args, **kwd):
        print "this %s method is for tesing purpose" % funct.__name__ 
        return funct(*args, **kwd)
    return inner
