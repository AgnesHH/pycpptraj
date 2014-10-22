from ArgList_py import ArgList 

arglist = ArgList()

for mystring in ["test_1", "test_2", "test_cool"]:
    arglist.AddArg(mystring)

arglist.PrintList()

arglist.ClearList()

arglist.PrintList()
