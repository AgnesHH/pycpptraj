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

        # update _inner doc for func
        _inner.__doc__ = func.__doc__
        _inner.__name__ = func.__name__
        return _inner
    return inner

def name_will_be_changed(msg):
    txt = "this method name will be changed"
    if not msg == "":
        txt +=  "to %s" % msg
    def inner(func):
        def _inner(self, *args, **kwd):
            print txt
            return func(self, *args, **kwd)
        return _inner
    return inner

def no_test(func):
    def _no_test(*args, **kwd):
        pass
    return _no_test

def not_yet_supported(func):
    def inner(*args, **kwd):
        print "%s not_yet_supported" % func.__name__
    return inner
