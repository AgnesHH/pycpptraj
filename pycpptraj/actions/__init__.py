""""""
from __future__ import absolute_import
from glob import glob

# FIXME
## get a list of Actions
#actionlist = [fullname.split(".")[0] for fullname in glob("Action*.pxd")]
#excludedList = ['Action_MRT', ]
#
#for ext in excludedList:
#    actionlist.remove(ext)
#
#__all__ = actionlist
#
#for action in actionlist:
#    #full_dir_action = ".".join(['pycpptraj', 'action', action, action])
#    full_dir_action = ".".join(['pycpptraj', 'action', action])
#    __import__(full_dir_action)
