from pycpptraj.DihedralSearch import DihedralSearch
from pycpptraj import Topology

top = Topology("./data/Tc5b.top")

dhsearch = DihedralSearch()
dhsearch.list_known_types()

