# place holder to read/write hd5py file format

from pycpptraj.Frame import Frame
from pycpptraj.FrameArray import FrameArray
from pycpptraj.utils.check_and_assert import _import_h5py, _import_numpy

has_h5py, h5py = _import_h5py()
has_numpy, np = _import_numpy()

assert has_h5py == True
assert has_numpy == True

# TODO : inherit from FrameArray?
#class HD5F(FrameArray):
class HD5F(FrameArray):
    def __init__(self, filename=None, mode='r', flag='hd5f', *args, **kwd):
        self.filename = filename
        self.mode = mode
        self.flag = flag # for what?

    def load(self, filename, mode='r', top=None):
        pass
        #h5fh = h5py.File(filename, mode)
        #self.resize(h5fh['coordinates'].shape[0])

        #for idx, arr in enumerate(h5fh['coordinates']):
        #    pass
            # allocate frame
            #self[idx] = Frame(arr.shape[0])
            #print self[idx].n_atoms
            # make sure to use np.float64 (double)
            #self[idx].set_from_crd(arr.flatten().astype(np.float64))

    def write(self, *args, **kwd):
        raise NotImplementedError("not yet supported")
