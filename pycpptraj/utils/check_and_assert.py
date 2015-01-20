def file_exist(filename):
    import os
    return os.path.isfile(filename)

def assert_almost_equal(arr0, arr1, decimals=3):
    '''numpy-like assert'''

    almost_equal = True
    SMALL = 10**(-decimals)

    for x, y in zip(arr0, arr1):
        if abs(x - y) > SMALL:
            almost_equal = False
    assert almost_equal == True

if __name__ == "__main__":
    assert_almost_equal([1., 2., 3.], [1., 2., 3.], decimals=3)
    assert_almost_equal([1., 2., 3.], [1., 2.,], decimals=3)
    assert_almost_equal([1., 2., 4.], [1., 2., 3.], decimals=3)
