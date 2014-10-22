def decme(f):
    def inner(*args, **kwargs):
        print "hello"
        f(*args, **kwargs)
    return inner

def func(x):
    print x

newfunc = decme(func)

@decme
def func2(x):
    print x


x = 2.
func(x)
#func2(x)
newfunc(x)
