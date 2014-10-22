class C(object):
    _p = 1

    @property
    def p(self):
        return self._p

    @p.setter
    def p(self, val):
        self._p = val

c = C()
print c.p.fset(3)
print c.p
