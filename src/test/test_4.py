class GetSet_1(object):
    x = 0

    def set_x(self, x):
        self.x = x

    def get_x(self):
        return self.x


class GetSet_2(object):
    _x = 0

    @property
    def x(self):
        return self._x

    @x.setter
    def x(self, x):
        self._x = x

getset = GetSet_1()
getset.set_x(3)
getset.x = 20
print getset.x

prop = GetSet_2()
prop.x = 5
print prop.x

