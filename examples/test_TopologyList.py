from TopologyList import TopologyList 

tl = TopologyList()
tl.AddParmFile("./test_PyCpptraj/Tc5b.ff99SB_JSC.mb3.newHmass.dt4fs.top")
tl.List()
tl.GetParm_test(0)
