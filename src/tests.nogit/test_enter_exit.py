class A(object):
    def __init__(self):
        print "hello"

    def __enter__(self):
        print "I am entering"

    def __exit__(self):
        print "I am exiting"
