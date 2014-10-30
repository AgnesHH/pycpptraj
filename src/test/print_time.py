def print_time(f, *args):
    import time
    t0  = time.time()
    f(*args)
    return time.time() - t0
