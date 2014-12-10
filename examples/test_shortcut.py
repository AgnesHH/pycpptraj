import pycpptraj as md
top = md.Topology("./data/Tc5b.top")
top.summary()

top2 = md.Topology(top)
print top2 == top
top2.summary()
