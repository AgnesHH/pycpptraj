from pycpptraj import Topology

top = Topology("data/Tc5b.top")

top.write_AmberParm("_Tc5b.top")

top2 = top.copy()
top2.strip_atoms("!@CA")
top2.write_AmberParm("_Tc5b_stripbutkeepCA.top")

top3 = top.copy()
top3.strip_atoms("@H*")
top3.write_AmberParm("_Tc5b_allH.top")
