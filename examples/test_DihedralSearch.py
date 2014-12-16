from pycpptraj.DihedralSearch import DihedralSearch
from pycpptraj import Topology

top = Topology(fname="./data/Tc5b.top")

dhsearch = DihedralSearch()
dhsearch.list_known_types()

