from TopologyList import TopologyList 

tl = TopologyList()
tl.AddParmFile("./test_PyCpptraj/Tc5b.ff99SB_JSC.mb3.newHmass.dt4fs.top")
tl.AddParmFile("./test_PyCpptraj/HP36.ff99SB_JSC.mb3.top")
tl.List()

t = tl.GetParm(1)
t.Summary()
