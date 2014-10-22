import sys

class Positive(object):
    def __init__(self, x):
        self._x = None
        self.x = x

    @property
    def x(self):
        return self._x

    @x.setter
    #wrapper method for assigning self.x value
    #When you set "self.x = value", Python will call this functino
    #x(value)

    def x(self, value):
        if value <= 0:
            raise Exception("must be positive") 
            sys.exit()
        self._x = value

if __name__ == '__main__':
    a = Positive(12.)
    print a.x
    print a._x

    a.x = -12.
    print a.x
