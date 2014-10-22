class Movie(object):
    def __init__(self, title, rating, runtime, budget, gross):
        self.testbudget = None

        self.title = title
        self.rating = rating
        self.runtime = runtime
        self.gross = gross
        self.budget = budget
        
    @property
    def budget(self):
        return self.testbudget
    
    @budget.setter
    def budget(self, value):
        if value < 0:
            raise ValueError("Negative value not allowed: %s" % value)
        self.testbudget = value
        
    def profit(self):
        return self.gross - self.budget
