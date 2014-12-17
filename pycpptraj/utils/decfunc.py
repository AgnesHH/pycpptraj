def is_base_class(func, *classname):
    def inner(self, *args, **kwargs):
        if self.__class__ == classname[0]:
            raise NotImplementedError("This is abstract methods")
        return func(*args, **kwargs)
    return inner
