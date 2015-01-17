from pycpptraj import io as mdio

top = mdio.readparm("./data/Tc5b.top")

# strip all atoms but CA
top.strip_atoms("!@CA")

# save new AMBER parm to file
mdio.writeparm("_Tcb5.onlyCA.top", top)
