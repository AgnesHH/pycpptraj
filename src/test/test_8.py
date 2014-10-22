class P:

    @property
    def a(self):
        if self.b == 12.:
            return 2*self.b

    @property
    def b(self):
        return self.b
