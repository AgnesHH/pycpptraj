def no_test(func):
    def _no_test(*args, **kwd):
        pass
    return _no_test

