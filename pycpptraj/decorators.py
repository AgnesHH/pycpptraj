def for_testing(func):
    def inner(*args, **kwd):
        print "this %s method is for tesing purpose" % func.__name__ 
        return func(*args, **kwd)
    return inner

def iter_warning(func):
    def inner(*args, **kwd):
        if args[0].size <= 0:
            raise ValueError("empty object, cannot do iteration")
        return func(*args, **kwd)
    return inner

def makesureABC(classname):
    def inner(func):
        def _inner(self, *args, **kwd):
            if self.__class__.__name__ == classname:
                raise NotImplementedError("This is Abstract Base Class")
            else:
                return func(self, *args, **kwd)
        return _inner
    return inner
