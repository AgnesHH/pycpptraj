from Trajin_Single import Trajin_Single

ts = Trajin_Single()

ts.BeginTraj(True)
ts.EndTraj()
ts.PrintInfo(1)
print ts.HasVelocity()
print ts.NreplicaDimension()


